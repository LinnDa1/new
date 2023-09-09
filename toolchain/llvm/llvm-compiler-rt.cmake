ExternalProject_Add(llvm-compiler-rt
    DEPENDS
        llvm-libcxx
    DOWNLOAD_COMMAND ""
    UPDATE_COMMAND ""
    SOURCE_DIR ${LLVM_SRC}
    LIST_SEPARATOR ,
    CONFIGURE_COMMAND ${EXEC} cmake -H<SOURCE_DIR>/compiler-rt -B<BINARY_DIR>
        -G Ninja
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/lib/clang/${clang_version}
        -DCMAKE_C_COMPILER=${TARGET_ARCH}-clang
        -DCMAKE_CXX_COMPILER=${TARGET_ARCH}-clang++
        -DCMAKE_SYSTEM_NAME=Windows
        -DCMAKE_AR=${CMAKE_INSTALL_PREFIX}/bin/llvm-ar
        -DCMAKE_RANLIB=${CMAKE_INSTALL_PREFIX}/bin/llvm-ranlib
        -DCMAKE_C_COMPILER_WORKS=1
        -DCMAKE_CXX_COMPILER_WORKS=1
        -DCMAKE_C_COMPILER_TARGET=${TARGET_CPU}-w64-windows-gnu
        -DCOMPILER_RT_DEFAULT_TARGET_ONLY=TRUE
        -DCOMPILER_RT_USE_BUILTINS_LIBRARY=TRUE
        -DCOMPILER_RT_BUILD_BUILTINS=FALSE
        -DLLVM_CONFIG_PATH=""
        -DCMAKE_FIND_ROOT_PATH=${MINGW_INSTALL_PREFIX}
        -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY
        -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ONLY
        -DSANITIZER_CXX_ABI=libc++
        -DCMAKE_CXX_FLAGS='-std=c++11'
        -DCMAKE_EXE_LINKER_FLAGS_INIT='-lc++abi'
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
cleanup(llvm-compiler-rt install)
