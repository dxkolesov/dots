#!/bin/bash

# Define source and destination directories
SOURCE_DIR=~/Downloads
FULL_POSTER_DIR=~/Downloads/posters
TINY_POSTER_DIR=~/Downloads/tiny-posters

# Create the destination directories if they don't exist
mkdir -p "$FULL_POSTER_DIR"
mkdir -p "$TINY_POSTER_DIR"

# Determine number of CPU cores (macOS compatible)
get_cpu_count() {
  if command -v nproc &>/dev/null; then
    nproc
  elif command -v sysctl &>/dev/null; then
    sysctl -n hw.ncpu
  else
    echo 2 # Default to 2 if we can't determine
  fi
}

CPU_COUNT=$(get_cpu_count)

# Check if avifenc is available
if ! command -v avifenc &>/dev/null; then
  echo "Error: avifenc is not installed. Please install it to continue."
  exit 1
fi

# Function to process a single video file
process_video() {
  local file="$1"

  # Get the filename without extension
  local filename=$(basename -- "$file")
  local name="${filename%.*}"

  echo "Processing $filename..."

  # Skip if output files already exist
  if [ -f "$FULL_POSTER_DIR/${name}.avif" ] && [ -f "$TINY_POSTER_DIR/${name}.avif" ]; then
    echo "AVIF posters for $filename already exist, skipping..."
    return 0
  fi

  # Create temporary directory for intermediate files
  local temp_dir=$(mktemp -d)

  # Extract frame and create full-size poster
  if ffmpeg -i "$file" -ss 00:00:00 -frames:v 1 -q:v 2 "$temp_dir/${name}.jpg" -y -v error; then
    # Convert full-size poster to AVIF
    if avifenc --min 0 --max 63 --speed 6 --jobs "$CPU_COUNT" "$temp_dir/${name}.jpg" "$FULL_POSTER_DIR/${name}.avif"; then
      # Create tiny pixelated poster
      if ffmpeg -i "$temp_dir/${name}.jpg" -vf "scale=32:-1,scale=320:-1:flags=neighbor" \
        -q:v 6 "$temp_dir/${name}_tiny.jpg" -y -v error; then

        # Convert tiny poster to AVIF
        if avifenc --min 0 --max 63 --speed 8 --jobs "$CPU_COUNT" "$temp_dir/${name}_tiny.jpg" "$TINY_POSTER_DIR/${name}.avif"; then
          echo "Created AVIF posters for $filename"
        else
          echo "Error converting tiny poster to AVIF for $filename"
        fi
      else
        echo "Error creating tiny poster for $filename"
      fi
    else
      echo "Error converting to AVIF for $filename"
    fi
  else
    echo "Error extracting frame from $filename"
  fi

  # Clean up temporary files
  rm -rf "$temp_dir"
}

# Export the function and variables so parallel can use them
export -f process_video
export FULL_POSTER_DIR
export TINY_POSTER_DIR
export CPU_COUNT

# Check if there are any video files in the source directory
video_count=$(find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "*.mp4" -o -name "*.MP4" -o -name "*.mov" -o -name "*.MOV" -o -name "*.avi" -o -name "*.AVI" -o -name "*.mkv" -o -name "*.MKV" -o -name "*.webm" -o -name "*.WEBM" \) | wc -l)

if [ "$video_count" -eq 0 ]; then
  echo "No video files found in $SOURCE_DIR. Nothing to process."
  exit 0
fi

# Process videos in parallel
echo "Processing $video_count videos in parallel..."
find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "*.mp4" -o -name "*.MP4" -o -name "*.mov" -o -name "*.MOV" -o -name "*.avi" -o -name "*.AVI" -o -name "*.mkv" -o -name "*.MKV" -o -name "*.webm" -o -name "*.WEBM" \) |
  parallel -j "$CPU_COUNT" process_video

# Check if any files were created
full_count=$(find "$FULL_POSTER_DIR" -name "*.avif" | wc -l)
tiny_count=$(find "$TINY_POSTER_DIR" -name "*.avif" | wc -l)

echo "Created $full_count full-size AVIF posters"
echo "Created $tiny_count tiny AVIF posters"

echo "All processing complete!"
echo "Full-quality AVIF posters are in $FULL_POSTER_DIR"
echo "Tiny AVIF posters are in $TINY_POSTER_DIR"
