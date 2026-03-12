#!/usr/bin/env bash

NIXFLAKE="$HOME/.nix"
DOTFILES="$HOME/.config"
BRANCH="main"

commit_repo () {
    cd "$1" || exit

    git add -A
    changes=$(git status --porcelain)

    if [ -z "$changes" ]; then
        echo "No changes in $1"
        return
    fi

    add_list=()
    update_list=()
    delete_list=()

    while IFS= read -r line; do
        status=$(echo "$line" | cut -c1-2)
        file=$(echo "$line" | cut -c4-)

        case "$status" in
            "A " | "??")
                add_list+=("$file")
                ;;
            " M" | "M ")
                update_list+=("$file")
                ;;
            " D" | "D ")
                delete_list+=("$file")
                ;;
        esac
    done <<< "$changes"

    msg=""

    for f in "${add_list[@]}"; do
        msg+="add: $f"$'\n'
    done

    for f in "${update_list[@]}"; do
        msg+="update: $f"$'\n'
    done

    for f in "${delete_list[@]}"; do
        msg+="delete: $f"$'\n'
    done

    if [ -n "$msg" ]; then
        git commit -m "$msg"
        git push origin "$BRANCH"
    else
        echo "No commit-worthy changes in $1"
    fi
}

echo "Updating: playfairs/nix"
commit_repo "$NIXFLAKE"

echo "Updating: playfairs/.dotfiles"
commit_repo "$DOTFILES"

echo "ok."