if(COMPILER_TOOLCHAIN STREQUAL "gcc")
    set(vapoursynth_pkgconfig_libs "-lvapoursynth")
    set(vapoursynth_script_pkgconfig_libs "-lvsscript")
    set(vapoursynth_manual_install_copy_lib COMMAND ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/libvsscript.a ${MINGW_INSTALL_PREFIX}/lib/libvsscript.a
                                            COMMAND ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/libvapoursynth.a ${MINGW_INSTALL_PREFIX}/lib/libvapoursynth.a)
elseif(COMPILER_TOOLCHAIN STREQUAL "clang")
    set(vapoursynth_pkgconfig_libs "-lVapourSynth -Wl,-delayload=VapourSynth.dll")
    set(vapoursynth_script_pkgconfig_libs "-lVSScript -Wl,-delayload=VSScript.dll")
    set(vapoursynth_manual_install_copy_lib COMMAND ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/VSScript.lib ${MINGW_INSTALL_PREFIX}/lib/VSScript.lib
                                            COMMAND ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/VapourSynth.lib ${MINGW_INSTALL_PREFIX}/lib/VapourSynth.lib)
endif()

if(TARGET_CPU STREQUAL "x86_64")
    set(dlltool_image "i386:x86-64")
elseif(TARGET_CPU STREQUAL "i686")
    set(dlltool_image "i386")
elseif(TARGET_CPU STREQUAL "armv7")
elseif(TARGET_CPU STREQUAL "aarch64")
    set(dlltool_image "arm64")
endif()
