#!/bin/bash -e
#
# version="0.1"
#
# This is a rather minimal example Argbash potential
# Example taken from http://argbash.readthedocs.io/en/stable/example.html
#
# ARG_OPTIONAL_SINGLE([compiler],[c],[Compiler to use: clang, gcc],[gcc])
# ARG_OPTIONAL_SINGLE([compiler-major],[M],[Compiler major version])
# ARG_OPTIONAL_SINGLE([compiler-minor],[m],[Compiler minor version])
# ARG_OPTIONAL_BOOLEAN([compiler-names-add-version],[],[Adding version when declaring CC, CPP variables for CMake],[on])
# ARG_OPTIONAL_SINGLE([compiler-libcxx],[],[The version of libcxx to use in a build: libstdc++11,libstdc++,libc++],[libstdc++11])
# ARG_OPTIONAL_SINGLE([build-type],[t],[Build type: Release, Debug, RelWithDebInfo, MinSizeRel],[Release])
# ARG_OPTIONAL_SINGLE([build-dir],[d],[Directory to build in (CMAKE_BINARY_DIR in terms of CMake)])
# ARG_OPTIONAL_SINGLE([source-dir],[s],[Source root directory (if not specified considered a parent directory of a build directory)])
# ARG_OPTIONAL_BOOLEAN([conan-enable],[],[Enable conan for a project (runs 'conan install' command with necessary flags for a given source directory)],[off])
# ARG_OPTIONAL_SINGLE([conan-options],[],[Extra Conan options (e.g. "-r my-remote-server")])
# ARG_OPTIONAL_SINGLE([conan-deploy-path],[],[Run conan deploy install to a given path])
# ARG_OPTIONAL_SINGLE([cmake-path],[],[Path to CMake],[cmake])
# ARG_OPTIONAL_SINGLE([ctest-path],[],[Path to CTest],[ctest])
# ARG_OPTIONAL_SINGLE([cmake-options],[],[Extra CMake options (e.g. "-DCMAKE_INSTALL_PREFIX=install_path -DMy_PRJ_FLAG_X=On <...>")])
# ARG_OPTIONAL_BOOLEAN([cmake-ninja],[n],[Use Ninja as cmake generator option],[off])
# ARG_OPTIONAL_BOOLEAN([run-ctest],[],[Run unit tests with CTest],[off])
# ARG_OPTIONAL_BOOLEAN([run-install],[],[Run install with CMake],[off])
# ARG_OPTIONAL_SINGLE([make-jobs],[j],[Number of jobs when running make],[1])
# ARG_OPTIONAL_SINGLE([banner-text],[],[Print banner with specified text])
# ARG_OPTIONAL_BOOLEAN([trace-commands],[],[Print executed commands],[off])
# ARG_OPTIONAL_BOOLEAN([dry-run],[],[Run without executing commands],[off])
# ARG_HELP([The general script's help msg])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.9.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
    local _ret="${2:-1}"
    test "${_PRINT_HELP:-no}" = yes && print_help >&2
    echo "$1" >&2
    exit "${_ret}"
}


begins_with_short_option()
{
    local first_option all_short_options='cMmtdsnjh'
    first_option="${1:0:1}"
    test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_compiler="gcc"
_arg_compiler_major=
_arg_compiler_minor=
_arg_compiler_names_add_version="on"
_arg_compiler_libcxx="libstdc++11"
_arg_build_type="Release"
_arg_build_dir=
_arg_source_dir=
_arg_conan_enable="off"
_arg_conan_options=
_arg_conan_deploy_path=
_arg_cmake_path="cmake"
_arg_ctest_path="ctest"
_arg_cmake_options=
_arg_cmake_ninja="off"
_arg_run_ctest="off"
_arg_run_install="off"
_arg_make_jobs="1"
_arg_banner_text=
_arg_trace_commands="off"
_arg_dry_run="off"


print_help()
{
    printf '%s\n' "The general script's help msg"
    printf 'Usage: %s [-c|--compiler <arg>] [-M|--compiler-major <arg>] [-m|--compiler-minor <arg>] [--(no-)compiler-names-add-version] [--compiler-libcxx <arg>] [-t|--build-type <arg>] [-d|--build-dir <arg>] [-s|--source-dir <arg>] [--(no-)conan-enable] [--conan-options <arg>] [--conan-deploy-path <arg>] [--cmake-path <arg>] [--ctest-path <arg>] [--cmake-options <arg>] [-n|--(no-)cmake-ninja] [--(no-)run-ctest] [--(no-)run-install] [-j|--make-jobs <arg>] [--banner-text <arg>] [--(no-)trace-commands] [--(no-)dry-run] [-h|--help]\n' "$0"
    printf '\t%s\n' "-c, --compiler: Compiler to use: clang, gcc (default: 'gcc')"
    printf '\t%s\n' "-M, --compiler-major: Compiler major version (no default)"
    printf '\t%s\n' "-m, --compiler-minor: Compiler minor version (no default)"
    printf '\t%s\n' "--compiler-names-add-version, --no-compiler-names-add-version: Adding version when declaring CC, CPP variables for CMake (on by default)"
    printf '\t%s\n' "--compiler-libcxx: The version of libcxx to use in a build: libstdc++11,libstdc++,libc++ (default: 'libstdc++11')"
    printf '\t%s\n' "-t, --build-type: Build type: Release, Debug, RelWithDebInfo, MinSizeRel (default: 'Release')"
    printf '\t%s\n' "-d, --build-dir: Directory to build in (CMAKE_BINARY_DIR in terms of CMake) (no default)"
    printf '\t%s\n' "-s, --source-dir: Source root directory (if not specified considered a parent directory of a build directory) (no default)"
    printf '\t%s\n' "--conan-enable, --no-conan-enable: Enable conan for a project (runs 'conan install' command with necessary flags for a given source directory) (off by default)"
    printf '\t%s\n' "--conan-options: Extra Conan options (e.g. \"-r my-remote-server\") (no default)"
    printf '\t%s\n' "--conan-deploy-path: Run conan deploy install to a given path (no default)"
    printf '\t%s\n' "--cmake-path: Path to CMake (default: 'cmake')"
    printf '\t%s\n' "--ctest-path: Path to CTest (default: 'ctest')"
    printf '\t%s\n' "--cmake-options: Extra CMake options (e.g. \"-DCMAKE_INSTALL_PREFIX=install_path -DMy_PRJ_FLAG_X=On <...>\") (no default)"
    printf '\t%s\n' "-n, --cmake-ninja, --no-cmake-ninja: Use Ninja as cmake generator option (off by default)"
    printf '\t%s\n' "--run-ctest, --no-run-ctest: Run unit tests with CTest (off by default)"
    printf '\t%s\n' "--run-install, --no-run-install: Run install with CMake (off by default)"
    printf '\t%s\n' "-j, --make-jobs: Number of jobs when running make (default: '1')"
    printf '\t%s\n' "--banner-text: Print banner with specified text (no default)"
    printf '\t%s\n' "--trace-commands, --no-trace-commands: Print executed commands (off by default)"
    printf '\t%s\n' "--dry-run, --no-dry-run: Run without executing commands (off by default)"
    printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
    while test $# -gt 0
    do
        _key="$1"
        case "$_key" in
            -c|--compiler)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_compiler="$2"
                shift
                ;;
            --compiler=*)
                _arg_compiler="${_key##--compiler=}"
                ;;
            -c*)
                _arg_compiler="${_key##-c}"
                ;;
            -M|--compiler-major)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_compiler_major="$2"
                shift
                ;;
            --compiler-major=*)
                _arg_compiler_major="${_key##--compiler-major=}"
                ;;
            -M*)
                _arg_compiler_major="${_key##-M}"
                ;;
            -m|--compiler-minor)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_compiler_minor="$2"
                shift
                ;;
            --compiler-minor=*)
                _arg_compiler_minor="${_key##--compiler-minor=}"
                ;;
            -m*)
                _arg_compiler_minor="${_key##-m}"
                ;;
            --no-compiler-names-add-version|--compiler-names-add-version)
                _arg_compiler_names_add_version="on"
                test "${1:0:5}" = "--no-" && _arg_compiler_names_add_version="off"
                ;;
            --compiler-libcxx)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_compiler_libcxx="$2"
                shift
                ;;
            --compiler-libcxx=*)
                _arg_compiler_libcxx="${_key##--compiler-libcxx=}"
                ;;
            -t|--build-type)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_build_type="$2"
                shift
                ;;
            --build-type=*)
                _arg_build_type="${_key##--build-type=}"
                ;;
            -t*)
                _arg_build_type="${_key##-t}"
                ;;
            -d|--build-dir)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_build_dir="$2"
                shift
                ;;
            --build-dir=*)
                _arg_build_dir="${_key##--build-dir=}"
                ;;
            -d*)
                _arg_build_dir="${_key##-d}"
                ;;
            -s|--source-dir)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_source_dir="$2"
                shift
                ;;
            --source-dir=*)
                _arg_source_dir="${_key##--source-dir=}"
                ;;
            -s*)
                _arg_source_dir="${_key##-s}"
                ;;
            --no-conan-enable|--conan-enable)
                _arg_conan_enable="on"
                test "${1:0:5}" = "--no-" && _arg_conan_enable="off"
                ;;
            --conan-options)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_conan_options="$2"
                shift
                ;;
            --conan-options=*)
                _arg_conan_options="${_key##--conan-options=}"
                ;;
            --conan-deploy-path)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_conan_deploy_path="$2"
                shift
                ;;
            --conan-deploy-path=*)
                _arg_conan_deploy_path="${_key##--conan-deploy-path=}"
                ;;
            --cmake-path)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_cmake_path="$2"
                shift
                ;;
            --cmake-path=*)
                _arg_cmake_path="${_key##--cmake-path=}"
                ;;
            --ctest-path)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_ctest_path="$2"
                shift
                ;;
            --ctest-path=*)
                _arg_ctest_path="${_key##--ctest-path=}"
                ;;
            --cmake-options)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_cmake_options="$2"
                shift
                ;;
            --cmake-options=*)
                _arg_cmake_options="${_key##--cmake-options=}"
                ;;
            -n|--no-cmake-ninja|--cmake-ninja)
                _arg_cmake_ninja="on"
                test "${1:0:5}" = "--no-" && _arg_cmake_ninja="off"
                ;;
            -n*)
                _arg_cmake_ninja="on"
                _next="${_key##-n}"
                if test -n "$_next" -a "$_next" != "$_key"
                then
                    { begins_with_short_option "$_next" && shift && set -- "-n" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
                fi
                ;;
            --no-run-ctest|--run-ctest)
                _arg_run_ctest="on"
                test "${1:0:5}" = "--no-" && _arg_run_ctest="off"
                ;;
            --no-run-install|--run-install)
                _arg_run_install="on"
                test "${1:0:5}" = "--no-" && _arg_run_install="off"
                ;;
            -j|--make-jobs)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_make_jobs="$2"
                shift
                ;;
            --make-jobs=*)
                _arg_make_jobs="${_key##--make-jobs=}"
                ;;
            -j*)
                _arg_make_jobs="${_key##-j}"
                ;;
            --banner-text)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_banner_text="$2"
                shift
                ;;
            --banner-text=*)
                _arg_banner_text="${_key##--banner-text=}"
                ;;
            --no-trace-commands|--trace-commands)
                _arg_trace_commands="on"
                test "${1:0:5}" = "--no-" && _arg_trace_commands="off"
                ;;
            --no-dry-run|--dry-run)
                _arg_dry_run="on"
                test "${1:0:5}" = "--no-" && _arg_dry_run="off"
                ;;
            -h|--help)
                print_help
                exit 0
                ;;
            -h*)
                print_help
                exit 0
                ;;
            *)
                _PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
                ;;
        esac
        shift
    done
}

parse_commandline "$@"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

# Execute command with respect to trace and dry-run options
wrapped_execute()
{
    local _cmd="$*"

    if [ "on" == "$_arg_trace_commands" ]; then
        echo ">> $_cmd"
    fi

    if [ "off" == "$_arg_dry_run" ]; then
        $_cmd
    fi
}

# wrapped_execute zzz sasas || true

# _PRINT_HELP=no die "FATAL ERROR: TEST" 1

if [ "" != "$_arg_banner_text" ]; then
echo "--------------------------------------------------"
echo ""
echo ""
echo "$_arg_banner_text"
echo ""
echo ""
echo "--------------------------------------------------"
fi

if [ "gcc" != "$_arg_compiler" ] && [ "clang" != "$_arg_compiler" ]; then
    _PRINT_HELP=yes die "FATAL ERROR: --compiler must be one of: [gcc, clang] " 1
fi

if [ "gcc" == "$_arg_compiler" ]; then
    _compiler_cc=gcc
    _compiler_cpp=cpp
    _compiler_cxx=g++
    _compiler_ar=gcc-ar
else
    _compiler_cc=clang
    _compiler_cxx=clang++
    _compiler_ar=llvm-ar
fi

if [ "on" == "$_arg_compiler_names_add_version" ]; then
    if [ "" == "$_arg_compiler_major" ]; then
        _PRINT_HELP=yes die "FATAL ERROR: --compiler-major option cannot be empty if compiler version  is required (--compiler-names-add-version)" 1
    fi

    _conan_compiler_version=$_arg_compiler_major
    wrapped_execute export CC=$_compiler_cc-$_arg_compiler_major
    if [ "gcc" == "$_arg_compiler" ]; then
        wrapped_execute export CPP=$_compiler_cpp-$_arg_compiler_major
    fi
    wrapped_execute export AR=$_compiler_ar-$_arg_compiler_major
    wrapped_execute export CXX=$_compiler_cxx-$_arg_compiler_major

    _conan_compiler_version=$_arg_compiler_major
    if [ "" != "$_arg_compiler_minor" ]; then
      _conan_compiler_version=$_conan_compiler_version.$_arg_compiler_minor
    fi
else
    wrapped_execute export CC=$_compiler_cc
    if [ "gcc" == "$_arg_compiler" ]; then
        wrapped_execute export CPP=$_compiler_cpp
    fi
    wrapped_execute export AR=$_compiler_ar
    wrapped_execute export CXX=$_compiler_cxx

    _conan_compiler_version=
fi

if [ "Debug" != "$_arg_build_type" ] && [ "Release" != "$_arg_build_type" ] && [ "RelWithDebInfo" != "$_arg_build_type" ] && [ "MinSizeRel" != "$_arg_build_type" ]; then
    _PRINT_HELP=yes die "FATAL ERROR: --build-type must be one of: [Release, Debug, RelWithDebInfo, MinSizeRel] " 1
fi

_arg_build_dir=$(readlink -f $_arg_build_dir)

if [ "" == "$_arg_source_dir" ]; then
    # Consider sources are located in parent directory
    # of a build directory.
    _arg_source_dir=$(dirname "$_arg_build_dir")
else
    _arg_source_dir=$(readlink -f $_arg_source_dir)
fi

echo "--------------------------------------------------"
echo "compiler              : $_compiler_cc"
echo "compiler version      : $_conan_compiler_version"
echo "compiler libcxx       : $_arg_compiler_libcxx"
echo "Build type            : $_arg_build_type"
echo "Build dir             : $_arg_build_dir"
echo "Conan enabled         : $_arg_conan_enable"
echo "Extra Conan options   : $_arg_conan_options"
echo "Conan deploy path     : $_arg_conan_deploy_path"
echo "Source dir            : $_arg_source_dir"
echo "CMake path            : $_arg_cmake_path"
echo "CTest path            : $_arg_ctest_path"
echo "Extra CMake options   : $_arg_cmake_options"
echo "CMake Ninja generator : $_arg_cmake_ninja"
echo "Run tests             : $_arg_run_ctest"
echo "Run install           : $_arg_run_install"
echo "Trace commands        : $_arg_trace_commands"
echo "Dry run               : $_arg_dry_run"
echo "--------------------------------------------------"

wrapped_execute rm -rf $_arg_build_dir || true
wrapped_execute mkdir $_arg_build_dir
wrapped_execute cd $_arg_build_dir

if [ "on" == "$_arg_conan_enable" ]; then
    echo ""
    echo "Conan"
    echo "--------------------------------------------------"

    _conan_compiler_version_option=
    if [ "" != "$_conan_compiler_version" ]; then
        _conan_compiler_version_option="-s compiler.version=$_conan_compiler_version"
    fi

    wrapped_execute conan install \
                    -s compiler=$_compiler_cc \
                     $_conan_compiler_version_option \
                    -s compiler.libcxx=$_arg_compiler_libcxx \
                    -s build_type=$_arg_build_type \
                    --build missing \
                    $_arg_conan_options \
                    $_arg_source_dir

    if [ "" != "$_arg_conan_deploy_path" ]; then
        wrapped_execute conan install \
                        -s compiler=$_compiler_cc \
                        $_conan_compiler_version_option \
                        -s compiler.libcxx=$_arg_compiler_libcxx \
                        -s build_type=$_arg_build_type \
                        --build missing \
                        $_arg_conan_options \
                        -g deploy --install-folder $_arg_conan_deploy_path \
                        $_arg_source_dir
    fi

    echo "--------------------------------------------------"
fi

echo ""
echo "CMake"
echo "--------------------------------------------------"

_cmake_generator=

if [ "on" == "$_arg_cmake_ninja" ]; then
    _cmake_generator="-G Ninja"
fi

wrapped_execute $_arg_cmake_path \
                -DCMAKE_BUILD_TYPE=$_arg_build_type \
                -DEXPLICIT_LIBCXX=$_arg_compiler_libcxx \
                $_arg_cmake_options \
                $_cmake_generator \
                $_arg_source_dir

wrapped_execute $_arg_cmake_path --build . -j $_arg_make_jobs

echo "--------------------------------------------------"

if [ "on" == "$_arg_run_ctest" ]; then
    echo ""
    echo "CTest"
    echo "--------------------------------------------------"

    wrapped_execute $_arg_ctest_path -T test

    echo "--------------------------------------------------"
fi

if [ "on" == "$_arg_run_install" ]; then
    echo ""
    echo "Install"
    echo "--------------------------------------------------"

    wrapped_execute $_arg_cmake_path --build . --target install

    echo "--------------------------------------------------"
fi

# ] <-- needed because of Argbash
