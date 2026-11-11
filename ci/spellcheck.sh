#!/bin/bash

set -eu

aspell --version

# Check Markdown spelling using the appropriate language dictionary.

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

# Keep the existing English project dictionary.
if [[ ! -f "$dict_filename" ]]; then
    echo "No dictionary file found: $dict_filename"
    exit 1
fi

cp "$dict_filename" "$dict_path"

# Indonesian files are checked with the Indonesian dictionary.
# All other Markdown files use the English dictionary.
for fname in "${markdown_sources[@]}"; do
    if [[ "$fname" == "./src/title-page.md" ]]; then
        aspell_options=(--lang=id --ignore=3)
        use_personal_dictionary=false
    else
        aspell_options=(--lang=en --ignore=3)
        use_personal_dictionary=true
    fi

    if [[ "$mode" == "list" ]]; then
        if [[ "$use_personal_dictionary" == true ]]; then
            errors=$(aspell "${aspell_options[@]}" \
                --personal="$dict_path" list < "$fname")
        else
            errors=$(aspell "${aspell_options[@]}" list < "$fname")
        fi

        if [[ -n "$errors" ]]; then
            while IFS= read -r error; do
                grep --with-filename --line-number \
                    --color=always -F "$error" "$fname" || true
            done <<< "$errors"
        fi
    else
        if [[ "$use_personal_dictionary" == true ]]; then
            aspell "${aspell_options[@]}" \
                --dont-backup \
                --personal="$dict_path" \
                check "$fname"
        else
            aspell "${aspell_options[@]}" \
                --dont-backup \
                check "$fname"
        fi
    fi
done
