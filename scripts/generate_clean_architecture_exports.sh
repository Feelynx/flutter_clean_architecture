echo moving to the project directory...
cd ..

# Define mandatory directories
mandatory_directories=("lib/data" "lib/domain")

# Check if a directory path is provided
if [ -z "$1" ]; then
  directories=("${mandatory_directories[@]}")
else
  directories=("$1")
fi

# Loop through each directory and generate exports
for directory in "${directories[@]}"; do
  # Extract the last part of the directory path
  dir_name=$(basename "$directory")
  # Define the output file
  output_file="$directory/${dir_name}_exports.dart"

  # Remove the existing export file if it exists
  if [ -f "$output_file" ]; then
    rm "$output_file"
  fi

  # Start the output file with a comment
  echo "// Auto-generated file. Do not modify." > $output_file
  echo "" >> $output_file

  # Find all Dart files in the specified directory excluding .g.dart files
  find $directory -type f -name "*.dart" ! -name "*.g.dart" | while read file; do
    # Remove the directory prefix from the file path
    relative_path=${file#$directory/}
    # Convert file path to export statement
    echo "export '$relative_path';" >> $output_file
  done

  echo "Export file generated at $output_file"
done