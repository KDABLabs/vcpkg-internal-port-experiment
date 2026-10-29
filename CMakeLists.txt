cmake_minimum_required(VERSION 4.3)

# set vcpkg to bootstrap when project() is called
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/vcpkg/vcpkg/scripts/buildsystems/vcpkg.cmake)

# vcpkg ports, can use this env var to get the root dir of the project
set(ENV{PE_PROJECT_ROOT} "${CMAKE_SOURCE_DIR}")

# configuration options
option(BUILD_A_AS_PORT "Build a as a port instead of a normal lib" ON)

if(BUILD_A_AS_PORT)
    list(APPEND VCPKG_MANIFEST_FEATURES "a-as-port")
endif()


project(vcpkg_internal_port_experiment)

set(CMAKE_CXX_STANDARD 20)

# libraries
add_subdirectory(lib)

# main executable
add_executable(vcpkg_internal_port_experiment main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE b)
