#!/bin/bash
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh -M 8 -m 4 \
    -t Release \
    -d $_script_dir/../_build_gcc84 \
    -j $(nproc) \
    --conan-enable \
    "$@"
