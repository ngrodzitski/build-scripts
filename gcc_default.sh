#!/bin/bash
_script_dir=$(dirname "$0")
$_script_dir/linux_common.sh --no-compiler-names-add-version \
    -d $_script_dir/../_build_gcc_default \
    -j $(nproc) \
    --conan-enable \
    "$@"
