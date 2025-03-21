cmake_minimum_required(VERSION 3.27)

project(amoeba)

set(CMAKE_STATIC_LIBRARY_PREFIX "")

add_compile_definitions(AM_IMPLEMENTATION)

add_library(amoeba STATIC amoeba/amoeba.c)

set_target_properties(amoeba PROPERTIES OUTPUT_NAME "amoeba")
