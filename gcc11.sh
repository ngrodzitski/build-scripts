#!/bin/bash
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh -M 11 \
    -d $_script_dir/../_build_gcc11 \
    -j $(nproc) \
    --conan-enable \
    "$@"
