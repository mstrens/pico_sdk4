# CMAKE generated file: DO NOT EDIT!
# Generated by CMake Version 3.25
cmake_policy(SET CMP0009 NEW)

# C_SRC at CMakeLists.txt:17 (file)
file(GLOB NEW_GLOB LIST_DIRECTORIES true "C:/Data/zig_project/pico_sdk4/src/*.c")
set(OLD_GLOB
  "C:/Data/zig_project/pico_sdk4/src/hello.c"
  "C:/Data/zig_project/pico_sdk4/src/ws2812.c"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "C:/Data/zig_project/pico_sdk4/build/CMakeFiles/cmake.verify_globs")
endif()

# C_SRC at CMakeLists.txt:17 (file)
file(GLOB NEW_GLOB LIST_DIRECTORIES true "C:/Data/zig_project/pico_sdk4/src/*.cpp")
set(OLD_GLOB
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "C:/Data/zig_project/pico_sdk4/build/CMakeFiles/cmake.verify_globs")
endif()

# C_SRC at CMakeLists.txt:17 (file)
file(GLOB NEW_GLOB LIST_DIRECTORIES true "C:/Data/zig_project/pico_sdk4/src/*.h")
set(OLD_GLOB
  "C:/Data/zig_project/pico_sdk4/src/ws2812.h"
  "C:/Data/zig_project/pico_sdk4/src/ws2812.pio.h"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "C:/Data/zig_project/pico_sdk4/build/CMakeFiles/cmake.verify_globs")
endif()
