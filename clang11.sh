#!/bin/bash -xe
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh -c clang -M 11 \
    -d $_script_dir/../_build_clang11 \
    -j $(nproc) \
    --conan-enable \
    "$@"
