#!/usr/bin/env bash
# shellcheck disable=SC2086

# --- docker container name resolver: underscore vs hyphen ---
# usage: resolve_name <container_basename>
# example: docker exec -it "$(resolve_name mes_cdb_api_1)" bash

resolve_name() {
    local n="$1"
    local alt
    alt="$(printf "%s" "$n" | tr '_' '-')"

    local names
    names="$(docker ps --format '{{.Names}}')"

    if printf "%s\n" "$names" | grep -Fxq "$n"; then
        printf "%s" "$n"; return 0
    fi
    if printf "%s\n" "$names" | grep -Fxq "$alt"; then
        printf "%s" "$alt"; return 0
    fi

    local all
    all="$(docker ps -a --format '{{.Names}}')"

    if printf "%s\n" "$all" | grep -Fxq "$n"; then
        printf "%s" "$n"; return 0
    fi
    if printf "%s\n" "$all" | grep -Fxq "$alt"; then
        printf "%s" "$alt"; return 0
    fi

    printf "%s" "$n"
}
