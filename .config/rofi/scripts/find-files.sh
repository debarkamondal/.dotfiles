#!/usr/bin/env bash

HISTFILE="$HOME/.local/share/rofi/find-files-history"
mkdir -p "$(dirname "$HISTFILE")"
touch "$HISTFILE"

# If ROFI_INFO is set, use it as the target (since we pass the full path via info)
if [ -n "$ROFI_INFO" ]; then
    TARGET="$ROFI_INFO"
elif [ -n "$1" ]; then
    TARGET="$1"
fi

if [ -n "$TARGET" ]; then
    # Update history (remove old entry if exists, then prepend)
    grep -v -F -x "$TARGET" "$HISTFILE" > "$HISTFILE.tmp" 2>/dev/null || true
    echo "$TARGET" | cat - "$HISTFILE.tmp" | head -n 50 > "$HISTFILE" 2>/dev/null
    rm -f "$HISTFILE.tmp"
    
    xdg-open "$TARGET" >/dev/null 2>&1 &
    exit 0
fi

# Output basename for display, but full path as hidden 'info'
# Directories will have a trailing slash for clarity
{
    EXCLUDES="-E node_modules -E build -E dist -E venv -E .venv -E target -E __pycache__ -E .idea -E .vscode -E .next -E Android"
    # Note: -H (hidden) flag has been removed so fd ignores all hidden files and folders by default
    fd . "$HOME" /mnt/ -t d $EXCLUDES --max-depth 5 | sed 's/^/d|/'
    fd . "$HOME" /mnt/ -t f $EXCLUDES --max-depth 5 | sed 's/^/f|/'
} | awk -F'|' -v histfile="$HISTFILE" '
BEGIN {
    while ((getline line < histfile) > 0) {
        history[line] = 1
        cmd = "test -d \"" line "\""
        is_dir = (system(cmd) == 0)
        n = split(line, arr, "/")
        b = arr[n]
        if (b == "") { b = arr[n-1]; line = substr(line, 1, length(line)-1) }
        if (is_dir) {
            printf "%s/\0info\x1f%s\n", b, line
        } else {
            printf "%s\0info\x1f%s\n", b, line
        }
        fflush()
    }
}
{
    type = $1
    path = substr($0, 3)
    if (path in history) next
    
    n = split(path, arr, "/")
    b = arr[n]
    if (b == "") { b = arr[n-1]; path = substr(path, 1, length(path)-1) }
    
    if (type == "d") {
        printf "%s/\0info\x1f%s\n", b, path
    } else {
        printf "%s\0info\x1f%s\n", b, path
    }
    fflush()
}'
