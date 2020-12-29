#!/bin/bash -xe
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh -c clang -M 10 \
    -d $_script_dir/../_build_clang10 \
    -j $(nproc) \
    --conan-enable \
    "$@"
