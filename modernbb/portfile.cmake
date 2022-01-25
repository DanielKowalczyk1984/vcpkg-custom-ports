
vcpkg_from_gitlab(
    GITLAB_URL https://gitlab.kuleuven.be
    OUT_SOURCE_PATH SOURCE_PATH
    REF v0.0.6
    SHA512 6d1d3f50b336a136641f8b6119c9c2c7e4c85e2702d56fd06dc5eb6d27ef17b66bd40b994eca7a9cdc438eb2d15f946c19c9b0caf98f6243cbd09e42d1a25b66
    REPO u0056096/branch-and-bound
)

# if (VCPKG_LVIBRARY_LINKAGE STREQUAL dynamic)
#     message(STATUS "Warning: Dynamic building not supported yet. Building static.")
#     set(VCPKG_LIBRARY_LINKAGE static)
# endif()
vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "branch-and-bound")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_copy_pdbs()