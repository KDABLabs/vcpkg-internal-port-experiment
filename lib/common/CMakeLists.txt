message("configuring lib common")
add_library(common STATIC src/common.cpp)
target_include_directories(common PUBLIC src)
