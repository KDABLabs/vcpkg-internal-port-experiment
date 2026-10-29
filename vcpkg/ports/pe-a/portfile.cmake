vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

set(PE_PROJECT_ROOT "$ENV{PE_PROJECT_ROOT}")

set(SOURCE_PATH "${PE_PROJECT_ROOT}/lib/a")

file(COPY
        "${CMAKE_CURRENT_LIST_DIR}/aConfig.cmake"
        DESTINATION
        "${SOURCE_PATH}")

# tell the CMakeLists file that we are building from VCPKG
vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DBUILD_FROM_VCPKG=ON)

vcpkg_cmake_install()

vcpkg_copy_pdbs()
