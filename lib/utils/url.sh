#!/usr/bin/env bash

if [ -z "${BPKG_URL}" ]; then
  BPKG_URL=1

  ## Collection of shared bpkg functions

  bpkg_solve_uri() {
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

  export -f bpkg_solve_uri
fi
