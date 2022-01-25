
vcpkg_from_gitlab(
    GITLAB_URL https://gitlab.kuleuven.be
    OUT_SOURCE_PATH SOURCE_PATH
    REF b8dbb32771d65008720c4e63aeae8dc31dc624b0
    SHA512 9b524b0d9b37293acacd3e28e98ba191261f2d742868ae52a4a1acd3f7fcefbde220e96c5f4e7a60b6ca6331dc060b74f6e130e513eb6ed821caa5e2e4e8d1e4
    REPO u0056096/or-utils
    HEAD_REF develop
)

set(ENV{GUROBI_HOME} "C:/gurobi912/win64")
# if (VCPKG_LVIBRARY_LINKAGE STREQUAL dynamic)
#     message(STATUS "Warning: Dynamic building not supported yet. Building static.")
#     set(VCPKG_LIBRARY_LINKAGE static)
# endif()
vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_copy_pdbs()