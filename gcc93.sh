#!/bin/bash
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh -M 9 -m 3 \
    -d $_script_dir/../_build_gcc93 \
    -j $(nproc) \
    --conan-enable \
    "$@"
