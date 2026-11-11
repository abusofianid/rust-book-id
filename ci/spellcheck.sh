
#!/bin/bash

set -eu

aspell --version

# Checks project Markdown files for spelling mistakes.
# English is the primary dictionary; Indonesian is an additional dictionary.

shopt -s nullglob

dict_filename=./ci/dictionary.txt
markdown_sources=(./src/*.md)
mode="check"
dict_path="/tmp/dictionary.txt"

if [[ "${1:-}" == "list" ]]; then
    mode="list"
fi

# Verify that both dictionaries are available.
aspell --lang=en dump dicts | grep -q '^en$'
aspell --lang=id dump dicts | grep -q '^id$'

# Use English as the base language and Indonesian as an extra dictionary.
aspell_options=(
    --lang=en
    --extra-dicts=id
    --ignore=3
)

if [[ "$mode" == "list" && ! -f "$dict_filename" ]]; then
    echo "No dictionary file found! A dictionary file is required in CI!"
    exit 1
fi

if [[ ! -f "$dict_filename" ]]; then
    echo "Scanning files to generate dictionary file '$dict_filename'."
    echo "Please check that it doesn't contain any misspellings."

    echo "personal_ws-1.1 en 0 utf-8" > "$dict_filename"
    cat "${markdown_sources[@]}" |
        aspell "${aspell_options[@]}" list |
        sort -u >> "$dict_filename"

elif [[ "$mode" == "list" ]]; then
    declare -i retval=0

    cp "$dict_filename" "$dict_path"

    for fname in "${markdown_sources[@]}"; do
        errors=$(aspell "${aspell_options[@]}" \
            --personal="$dict_path" list < "$fname")

        if [[ -n "$errors" ]]; then
            while IFS= read -r error; do
                grep --with-filename --line-number \
                    --color=always -F "$error" "$fname" || true
            done <<< "$errors"

            retval=1
        fi
    done

    exit "$retval"

elif [[ "$mode" == "check" ]]; then
    cp "$dict_filename" "$dict_path"

    for fname in "${markdown_sources[@]}"; do
        aspell "${aspell_options[@]}" \
            --dont-backup \
            --personal="$dict_path" \
            check "$fname"
    done
fi
