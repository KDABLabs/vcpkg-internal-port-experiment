# being built as a port, not in-tree
if (BUILD_A_AS_PORT)
    return()
endif()

cmake_minimum_required(VERSION 4.0)

project(a)

message("configuring lib a")
add_library(${PROJECT_NAME} STATIC a/a.cpp)

if (BUILD_FROM_VCPKG)
    install(TARGETS ${PROJECT_NAME} EXPORT a-targets
            RUNTIME DESTINATION bin
            LIBRARY DESTINATION lib
            ARCHIVE DESTINATION lib
    )

    install(
            EXPORT a-targets
            FILE aTargets.cmake
            NAMESPACE vipe::
            DESTINATION share/a
    )

    configure_file(
            "${CMAKE_CURRENT_LIST_DIR}/aConfig.cmake"
            "${CMAKE_INSTALL_PREFIX}/share/a/aConfig.cmake" @ONLY)

    install(
            DIRECTORY a
            DESTINATION include/
            FILES_MATCHING
            PATTERN "*.h"
    )

    target_include_directories(${PROJECT_NAME}
            INTERFACE
            $<INSTALL_INTERFACE:include>/a
    )
else()
    target_include_directories(${PROJECT_NAME} PUBLIC a)
endif()
