# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/libh/emscripten/project/jingdong

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/libh/emscripten/project/jingdong/build

# Include any dependencies generated for this target.
include CMakeFiles/b_sources.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/b_sources.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/b_sources.dir/flags.make

CMakeFiles/b_sources.dir/src/test.cpp.o: CMakeFiles/b_sources.dir/flags.make
CMakeFiles/b_sources.dir/src/test.cpp.o: ../src/test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/libh/emscripten/project/jingdong/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/b_sources.dir/src/test.cpp.o"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/b_sources.dir/src/test.cpp.o -c /home/libh/emscripten/project/jingdong/src/test.cpp

CMakeFiles/b_sources.dir/src/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/b_sources.dir/src/test.cpp.i"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/libh/emscripten/project/jingdong/src/test.cpp > CMakeFiles/b_sources.dir/src/test.cpp.i

CMakeFiles/b_sources.dir/src/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/b_sources.dir/src/test.cpp.s"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/libh/emscripten/project/jingdong/src/test.cpp -o CMakeFiles/b_sources.dir/src/test.cpp.s

b_sources: CMakeFiles/b_sources.dir/src/test.cpp.o
b_sources: CMakeFiles/b_sources.dir/build.make

.PHONY : b_sources

# Rule to build all files generated by this target.
CMakeFiles/b_sources.dir/build: b_sources

.PHONY : CMakeFiles/b_sources.dir/build

CMakeFiles/b_sources.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/b_sources.dir/cmake_clean.cmake
.PHONY : CMakeFiles/b_sources.dir/clean

CMakeFiles/b_sources.dir/depend:
	cd /home/libh/emscripten/project/jingdong/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/libh/emscripten/project/jingdong /home/libh/emscripten/project/jingdong /home/libh/emscripten/project/jingdong/build /home/libh/emscripten/project/jingdong/build /home/libh/emscripten/project/jingdong/build/CMakeFiles/b_sources.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/b_sources.dir/depend

