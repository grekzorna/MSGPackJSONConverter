# Set up project
cmake_minimum_required(VERSION 3.30)
project(MSGEncrDecr)
# Set C++ standard
set(CMAKE_CXX_STANDARD 20)
# Add compile options
include_directories(./include)
# Create exe reference
add_executable(MSGexec src/main.cpp
        src/FileDialogWrap.cpp
        include/FileDialogWrap.h)
# Add library
find_package(taocpp-json)
target_link_libraries(MSGexec taocpp::json)

add_compile_options(-O3 -DNDEBUG)
add_link_options(-s)
target_link_libraries(MSGexec -static-libgcc -static-libstdc++)