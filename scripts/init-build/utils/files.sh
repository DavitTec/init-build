ensure_dir() {
  mkdir -p "$@"
}

write_file() {
  local path="$1"
  shift
  mkdir -p "$(dirname "$path")"
  cat > "$path" <<EOF
$*
EOF
}