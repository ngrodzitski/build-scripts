# Build scripts

A collection of scripts for building C++ projects with CMake and [Conan](https://conan.io/) package manager.

In order for default paths to work a directory with scripts `build-scripts` is considered to be on the same level as root `CMakeLists.txt`.

## linux

Core script is `linux_common.sh`. Help speaks for itself:

```
$ ./linux_common.sh -h
The general script's help msg
Usage: ./linux_common.sh [-c|--compiler <arg>] [-M|--compiler-major <arg>] [-m|--compiler-minor <arg>] [-t|--build-type <arg>] [-d|--build-dir <arg>] [-s|--source-dir <arg>] [-j|--make-jobs <arg>] [--cmake-path <arg>] [--cmake-options <arg>] [--(no-)compiler-names-add-version] [--(no-)conan-enable] [--(no-)run-ctest] [--(no-)run-install] [--banner-text <arg>] [--(no-)trace-commands] [--(no-)dry-run] [-h|--help]
    -c, --compiler: Compiler to use: clang, gcc (default: 'gcc')
    -M, --compiler-major: Compiler major version (no default)
    -m, --compiler-minor: Compiler minor version (no default)
    -t, --build-type: Build type: Release, Debug, RelWithDebInfo (default: 'Release')
    -d, --build-dir: Directory to build in (CMAKE_BINARY_DIR in terms of CMake) (no default)
    -s, --source-dir: Source root directory (if not specified considered a parent directory of a build directory) (no default)
    -j, --make-jobs: Number of jobs when running make (default: '1')
    --cmake-path: Path to CMake (default: 'cmake')
    --cmake-options: Extra CMake options (e.g. "-DCMAKE_INSTALL_PREFIX=install_path -DMy_PRJ_FLAG_X=On <...>") (no default)
    --compiler-names-add-version, --no-compiler-names-add-version: Adding version when declaring CC, CPP variables for CMake (on by default)
    --conan-enable, --no-conan-enable: Enable conan for a project (runs 'conan install' command with necessary flags for a given source directory) (off by default)
    --run-ctest, --no-run-ctest: Run unit tests with CTest (off by default)
    --run-install, --no-run-install: Run install with CMake (off by default)
    --banner-text: Print banner with specified text (no default)
    --trace-commands, --no-trace-commands: Print executed commands (off by default)
    --dry-run, --no-dry-run: Run without executing commands (off by default)
    -h, --help: Prints help
```

Script prepares and executes shell commands to perform a build with given parameters.

Example of commands executed for gcc93:

```bash
export CC=gcc-9
export CPP=g++-9
export AR=gcc-ar-9
export CXX=g++-9
rm -rf /home/ngrodzitski/github/ngrodzitski/my_prj/_build_gcc93
mkdir /home/ngrodzitski/github/ngrodzitski/my_prj/_build_gcc93
cd /home/ngrodzitski/github/ngrodzitski/my_prj/_build_gcc93

conan install -s compiler=gcc -s compiler.version=9.3 -s \
      compiler.libcxx=libstdc++11 -s build_type=Release \
      --build missing /home/ngrodzitski/github/ngrodzitski/my_prj

cmake -DCMAKE_BUILD_TYPE=Release /home/ngrodzitski/github/ngrodzitski/my_prj
cmake --build . -j 8
```

## License

BSD 3-Clause [License](./LICENSE).

