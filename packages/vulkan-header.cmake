ExternalProject_Add(vulkan-header
    GIT_REPOSITORY https://github.com/KhronosGroup/Vulkan-Headers.git
    SOURCE_DIR ${SOURCE_LOCATION}
    # GIT_SHALLOW 1
    UPDATE_COMMAND ""
    GIT_REMOTE_NAME origin
    GIT_TAG 18963a6cc03fe15e3785d353dea6a1ff95115a5e
    CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
    BUILD_COMMAND ""
    INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_INSTALL 1
)
force_rebuild_git(vulkan-header)
cleanup(vulkan-header install)
