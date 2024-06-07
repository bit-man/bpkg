#!/usr/bin/env bash

if [ -z "${BPKG_URL}" ]; then
  BPKG_URL=1

  ## Collection of shared bpkg functions

  bpkg_resolve_uri_default() {
    local git_remote=$1
    local user=$2
    local name=$3
    local version=$4

    if [[ "$git_remote" == https://gitlab*  ]]; then
      echo "$user/$name/-/raw/$version"
    else
      echo "$user/$name/$version"
    fi
  }

  bpkg_resolve_uri() {
    [[ $(type -t bpkg_resolve_uri_pathspec) == function ]] && \
      bpkg_resolve_uri_pathspec "$@" 
    # shellcheck disable=SC2181
    [[ $? -eq 0 ]] && return 
    bpkg_resolve_uri_default "$@"
  }

  export -f bpkg_resolve_uri
  export -f bpkg_resolve_uri_default
fi
