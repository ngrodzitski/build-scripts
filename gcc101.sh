#!/bin/bash
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh -M 10 -m 1 \
    -t Release \
    -d $_script_dir/../_build_gcc101 \
    -j $(nproc) \
    --conan-enable \
    "$@"
