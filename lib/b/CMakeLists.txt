message("configuring lib b")
add_library(b STATIC src/b.cpp)

if (BUILD_A_AS_PORT)
    find_package(a CONFIG REQUIRED)
    target_link_libraries(b PRIVATE vipe::a)
else()
    target_link_libraries(b PRIVATE a)
endif()

target_link_libraries(b PRIVATE common)
target_include_directories(b PUBLIC src)
