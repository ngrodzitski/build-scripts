#!/bin/bash -xe
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh -c clang -M 9 \
    -d $_script_dir/../_build_clang9 \
    -j $(nproc) \
    --conan-enable \
    "$@"
