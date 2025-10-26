#!/usr/bin/env bash
# usage: resolve_name <project> <full_container_name>
# example: docker exec -it "$(resolve_name mes_cdb mes_cdb_web_1)" bash

resolve_name() {
    local project="$1"      # e.g. mes_cdb
    local full="$2"         # e.g. mes_cdb_web_1

    if [ -z "$project" ] || [ -z "$full" ]; then
        echo "Usage: resolve_name <project> <full_container_name>" >&2
        return 1
    fi

    # strip the project prefix (and a separating _ or - if present) to get the tail
    local tail="${full#$project}"
    tail="${tail#_}"
    tail="${tail#-}"

    # alt = project + '-' + (tail with '_' -> '-')
    local alt="${project}-$(printf "%s" "$tail" | tr '_' '-')"

    # check running containers first, then all containers
    local names all
    names="$(docker ps --format '{{.Names}}')"

    if printf "%s\n" "$names" | grep -Fxq "$full"; then
        printf "%s" "$full"; return 0
    fi
    if printf "%s\n" "$names" | grep -Fxq "$alt"; then
        printf "%s" "$alt"; return 0
    fi

    all="$(docker ps -a --format '{{.Names}}')"

    if printf "%s\n" "$all" | grep -Fxq "$full"; then
        printf "%s" "$full"; return 0
    fi
    if printf "%s\n" "$all" | grep -Fxq "$alt"; then
        printf "%s" "$alt"; return 0
    fi

    # fallback to original
    printf "%s" "$full"
}