bookie() {
    local file
    file=$(
        fd . /home/nahuel/personal/hub/bookies -t f -e pdf -e epub --hidden \
        | awk '{bn=$0; sub(".*/","",bn); printf "%s\t%s\n", bn, $0}' \
        | fzf --multi --prompt="Select book > " --with-nth=1 --delimiter="\t" \
        | cut -f2
    )

    if [[ -n "$file" ]]; then
        echo "$file" | while IFS= read -r f; do
            ebook-viewer "$f" &
        done
    else
        echo "no book selected."
    fi
}
