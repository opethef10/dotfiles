# functions.sh

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

wav2mp3() {
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

notify-send() { wsl-notify-send.exe "${@}"; }

obsidian() {
    local file_path="$1"
    if [ -z "$file_path" ]; then
        echo "Usage: obsidian <file_path>"
        return 1
    fi

    local obsidian_link="obsidian://open?vault=gdrive&file=$file_path"
    open "$obsidian_link"
}

# If you source this file, it will set WTTR_PARAMS as well as show weather.

# WTTR_PARAMS is space-separated URL parameters, many of which are single characters that can be
# lumped together. For example, "F q m" behaves the same as "Fqm".
if [[ -z "$WTTR_PARAMS" ]]; then
  # Form localized URL parameters for curl
  if [[ -t 1 ]] && [[ "$(tput cols)" -lt 125 ]]; then
      WTTR_PARAMS+='n'
  fi 2> /dev/null
  for _token in $( locale LC_MEASUREMENT ); do
    case $_token in
      1) WTTR_PARAMS+='m' ;;
      2) WTTR_PARAMS+='u' ;;
    esac
  done 2> /dev/null
  unset _token
  export WTTR_PARAMS
fi

weather() {
  local location="${1:-Ankara}"  # Default to Ankara if no location is provided
  location="${location// /+}"
  command shift
  local args=""
  for p in $WTTR_PARAMS "$@"; do
    args+=" --data-urlencode $p "
  done
  curl -fGsS -H "Accept-Language: ${LANG%_*}" $args --compressed "wttr.in/${location}"
}

pyclean() {
    if [ $# -eq 0 ]; then
        echo "Error: Please provide a directory path."
        return 1
    fi

    local path="$1"
    find "$path" -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
}

todaymd() {
    # Define the base directory
    base_dir=$DAILY_NOTES_FOLDER

    # Get the current year and month
    year=$(date +%Y)
    month=$(date +%m)

    # Create the directory structure if it doesn't exist
    mkdir -p "$base_dir/$year/$month"

    # Define the file path
    file_path="$base_dir/$year/$month/$(date +%Y-%m-%d).md"
    template_file="$base_dir/template.md"  # Path to the template file

    # Check if the daily note file exists
    if [[ ! -f "$file_path" ]]; then
        # If the file doesn't exist, copy the template to the daily note
        cp "$template_file" "$file_path"
    fi

    # Output the file path
    echo "$file_path"
}
