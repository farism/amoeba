cmake_minimum_required(VERSION 3.27)

project(amoeba)

# remove "lib" prefix on unix systems
set(CMAKE_STATIC_LIBRARY_PREFIX "")

# header only library, copy to .c file
configure_file(amoeba/amoeba.h ../amoeba.c COPYONLY)

# header only library, add implementation define
add_compile_definitions(AM_IMPLEMENTATION)

add_library(amoeba STATIC amoeba/amoeba.c)


if (WIN32)
    set(OUTPUT_DIR "windows" CACHE STRING "")
elseif(APPLE)
    set(OUTPUT_DIR "macos" CACHE STRING "")
elseif(UNIX)
    set(OUTPUT_DIR "linux" CACHE STRING "")
endif ()

set_target_properties(amoeba PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../libs/${OUTPUT_DIR}>) 
set_target_properties(amoeba PROPERTIES OUTPUT_NAME_DEBUG "amoebad")
set_target_properties(amoeba PROPERTIES OUTPUT_NAME_RELEASE "amoeba")