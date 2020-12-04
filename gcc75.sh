#!/bin/bash
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh -M 7 -m 5 \
    -d $_script_dir/../_build_gcc75 \
    -j $(nproc) \
    --conan-enable \
    "$@"
