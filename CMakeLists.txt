cmake_minimum_required(VERSION 2.8.12)
project(assembler)

#add_definitions("-std=c++11")

if (MSVC_VERSION GREATER_EQUAL "1900")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /std:c++latest")
    # add_compile_options("/std:c++latest")
else()
    message(FATAL_ERROR "Current msvc not support")
endif()


include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()
#conan_basic_setup(NO_OUTPUT_DIRS)

#SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR})
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(
    "${PROJECT_SOURCE_DIR}/include"
)

add_executable(assembler main.cpp)
target_link_libraries(assembler ${CONAN_LIBS})