#!/bin/bash

# Define source and destination directories
SOURCE_DIR=~/Downloads
VIDEO_DEST_DIR=~/Downloads/mp4_converted

# Create the destination directory if it doesn't exist
mkdir -p "$VIDEO_DEST_DIR"

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

# Function to convert a single video file to MP4
convert_video() {
  local file="$1"

  # Get the filename without extension
  local filename=$(basename -- "$file")
  local name="${filename%.*}"
  local output="$VIDEO_DEST_DIR/${name}.mp4"

  # Skip if output file already exists
  if [ -f "$output" ]; then
    echo "MP4 for $filename already exists, skipping..."
    return 0
  fi

  echo "Converting $filename to MP4..."

  # Convert video to MP4 preserving audio
  # Use hardware acceleration if available
  if ffmpeg -hwaccel auto -i "$file" -c:v libx264 -preset medium -crf 23 -c:a aac -b:a 128k \
    -movflags +faststart "$output" -y -v error; then
    echo "Converted $filename to MP4"
  else
    echo "Error converting $filename to MP4"
  fi
}

# Export the function and variables so parallel can use them
export -f convert_video
export VIDEO_DEST_DIR

# Check if there are any video files to convert
video_count=$(find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "*.mov" -o -name "*.MOV" -o -name "*.avi" -o -name "*.AVI" \
  -o -name "*.mkv" -o -name "*.MKV" -o -name "*.webm" -o -name "*.WEBM" -o -name "*.flv" -o -name "*.FLV" \
  -o -name "*.wmv" -o -name "*.WMV" \) | wc -l)

if [ "$video_count" -eq 0 ]; then
  echo "No video files found in $SOURCE_DIR. Nothing to convert."
  exit 0
fi

# Check if parallel is installed
if command -v parallel &>/dev/null; then
  # Process videos in parallel
  echo "Converting $video_count videos in parallel..."
  find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "*.mov" -o -name "*.MOV" -o -name "*.avi" -o -name "*.AVI" \
    -o -name "*.mkv" -o -name "*.MKV" -o -name "*.webm" -o -name "*.WEBM" -o -name "*.flv" -o -name "*.FLV" \
    -o -name "*.wmv" -o -name "*.WMV" \) |
    parallel -j "$CPU_COUNT" convert_video
else
  # Process videos sequentially if parallel is not available
  echo "Parallel not installed, converting videos sequentially..."

  # Enable case-insensitive globbing
  shopt -s nocaseglob

  # Process all video files in the source directory
  for file in "$SOURCE_DIR"/*.{mov,avi,mkv,webm,flv,wmv}; do
    # Skip if no files match the pattern
    [ -e "$file" ] || continue

    convert_video "$file"
  done

  # Disable case-insensitive globbing
  shopt -u nocaseglob
fi

# Count converted files
converted_count=$(find "$VIDEO_DEST_DIR" -name "*.mp4" | wc -l)
echo "Successfully converted $converted_count videos to MP4"
echo "All conversions complete!"
echo "Converted videos are in $VIDEO_DEST_DIR"
