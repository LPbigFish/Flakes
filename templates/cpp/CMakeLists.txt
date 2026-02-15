cmake_minimum_required(VERSION 3.15)

project(MyCppProject VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(my_executable_name src/main.cpp) # <-- CHANGE THIS TOO

target_compile_options(my_executable_name PRIVATE -Wall -Wextra -Wpedantic)