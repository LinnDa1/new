ExternalProject_Add(ffmpeg
    DEPENDS
        ${ffmpeg_x265}
        amf-headers
        aom
        avisynth-headers
        bzip2
        dav1d
        davs2
        fontconfig
        harfbuzz
        lame
        lcms2
        libaribcaption
        libass
        libbluray
        libbs2b
        libjxl
        libmodplug
        libmysofa
        libopenmpt
        libplacebo
        libsdl2
        libsoxr
        libsrt
        libssh
        libva
        libvpl
        libvpx
        libwebp
        libxml2
        libzimg
        libzvbi
        nvcodec-headers
        openssl
        opus
        rav1e
        rubberband
        shaderc
        speex
        uavs3d
        vapoursynth
        vorbis
        vulkan
        x264
        xvidcore
        xz
        zlib
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --pkg-config-flags=--static
        --disable-decoder=libaom_av1
        --disable-doc
        --disable-ffplay
        --disable-ffprobe
        --disable-shared
        --disable-vdpau
        --disable-videotoolbox
        --enable-amf
        --enable-avisynth
        --enable-bzlib
        --enable-cross-compile
        --enable-cuda-llvm
        --enable-cuvid
        --enable-d3d11va
        --enable-dxva2
        --enable-gpl
        --enable-iconv
        --enable-lcms2
        --enable-libaom
        --enable-libaribcaption
        --enable-libass
        --enable-libbluray
        --enable-libbs2b
        --enable-libdav1d
        --enable-libdavs2
        --enable-libfontconfig
        --enable-libfreetype
        --enable-libfribidi
        --enable-libharfbuzz
        --enable-libjxl
        --enable-libmodplug
        --enable-libmp3lame
        --enable-libmysofa
        --enable-libopenmpt
        --enable-libopus
        --enable-libplacebo
        --enable-librav1e
        --enable-librubberband
        --enable-libshaderc
        --enable-libsoxr
        --enable-libspeex
        --enable-libsrt
        --enable-libssh
        --enable-libuavs3d
        --enable-libvorbis
        --enable-libvpl
        --enable-libvpx
        --enable-libwebp
        --enable-libx264
        --enable-libx265
        --enable-libxml2
        --enable-libxvid
        --enable-libzimg
        --enable-libzvbi
        --enable-lzma
        --enable-mediafoundation
        --enable-nonfree
        --enable-nvdec
        --enable-nvenc
        --enable-openssl
        --enable-postproc
        --enable-pthreads
        --enable-runtime-cpudetect
        --enable-sdl2
        --enable-static
        --enable-vaapi
        --enable-vapoursynth
        --enable-version3
        --enable-vulkan
        --enable-zlib
        --extra-cflags='-Wno-error=int-conversion'
        "--extra-libs='${ffmpeg_extra_libs}'" # -lstdc++ / -lc++ needs by libjxl and shaderc
        ${ffmpeg_hardcoded_tables}
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
