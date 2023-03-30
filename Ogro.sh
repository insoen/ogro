#!/bin/sh
echo -ne '\033c\033]0;Ogro\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Ogro.x86_64" "$@"
