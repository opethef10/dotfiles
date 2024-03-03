# functions.sh

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

waw2mp3() {
    input_file="$1"
    output_file="${input_file%.*}.mp3"
    ffmpeg -i "$input_file" -vn -ar 44100 -ac 2 -b:a 192k "$output_file"
}

mp4compress() {
    input_file="$1"
    output_file="${input_file%.*}_compressed.mp4"
    ffmpeg -i "$input_file" -vcodec libx265 -crf 28 "$output_file"
}

chmod_recursive() {
  if [ $# -ne 1 ]; then
    echo "Usage: chmod_recursive <path>"
    return 1
  fi

  local path="$1"

  if [ ! -e "$path" ]; then
    echo "Path '$path' does not exist."
    return 1
  fi

  find "$path" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}

mp4to3() {
  if [ $# -ne 2 ]; then
    echo "Usage: mp4to3 <input_file.mp4> <output_file.mp3>"
    return 1
  fi

  local input_file="$1"
  local output_file="$2"

  if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' does not exist."
    return 1
  fi

  ffmpeg -i "$input_file" -f mp3 -ab 192000 -vn "$output_file"
}

obsidian() {
    local file_path="$1"
    if [ -z "$file_path" ]; then
        echo "Usage: obsidian <file_path>"
        return 1
    fi

    local obsidian_link="obsidian://open?vault=gdrive&file=$file_path"
    open "$obsidian_link"
}

