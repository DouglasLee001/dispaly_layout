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
CMAKE_SOURCE_DIR = /home/libh/emscripten/project/amazon

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/libh/emscripten/project/amazon/build

# Include any dependencies generated for this target.
include CMakeFiles/d_sources.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/d_sources.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/d_sources.dir/flags.make

CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.o: CMakeFiles/d_sources.dir/flags.make
CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.o: /home/libh/emscripten/project/solver_src/utils/matrix.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/libh/emscripten/project/amazon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.o"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.o -c /home/libh/emscripten/project/solver_src/utils/matrix.cpp

CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.i"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/libh/emscripten/project/solver_src/utils/matrix.cpp > CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.i

CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.s"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/libh/emscripten/project/solver_src/utils/matrix.cpp -o CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.s

d_sources: CMakeFiles/d_sources.dir/home/libh/emscripten/project/solver_src/utils/matrix.cpp.o
d_sources: CMakeFiles/d_sources.dir/build.make

.PHONY : d_sources

# Rule to build all files generated by this target.
CMakeFiles/d_sources.dir/build: d_sources

.PHONY : CMakeFiles/d_sources.dir/build

CMakeFiles/d_sources.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/d_sources.dir/cmake_clean.cmake
.PHONY : CMakeFiles/d_sources.dir/clean

CMakeFiles/d_sources.dir/depend:
	cd /home/libh/emscripten/project/amazon/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/libh/emscripten/project/amazon /home/libh/emscripten/project/amazon /home/libh/emscripten/project/amazon/build /home/libh/emscripten/project/amazon/build /home/libh/emscripten/project/amazon/build/CMakeFiles/d_sources.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/d_sources.dir/depend

