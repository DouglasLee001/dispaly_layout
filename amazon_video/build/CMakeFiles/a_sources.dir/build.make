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
CMAKE_SOURCE_DIR = /home/libh/emscripten/project/amazon_video

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/libh/emscripten/project/amazon_video/build

# Include any dependencies generated for this target.
include CMakeFiles/a_sources.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/a_sources.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/a_sources.dir/flags.make

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.o: CMakeFiles/a_sources.dir/flags.make
CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.o: /home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/libh/emscripten/project/amazon_video/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.o"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.o -c /home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.i"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp > CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.i

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.s"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.s

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.o: CMakeFiles/a_sources.dir/flags.make
CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.o: /home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/libh/emscripten/project/amazon_video/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.o"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.o -c /home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.i"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp > CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.i

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.s"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.s

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.o: CMakeFiles/a_sources.dir/flags.make
CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.o: /home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/libh/emscripten/project/amazon_video/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.o"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.o -c /home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.i"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp > CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.i

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.s"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.s

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.o: CMakeFiles/a_sources.dir/flags.make
CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.o: /home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/libh/emscripten/project/amazon_video/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.o"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.o -c /home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.i"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp > CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.i

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.s"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.s

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.o: CMakeFiles/a_sources.dir/flags.make
CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.o: /home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/libh/emscripten/project/amazon_video/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.o"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.o -c /home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.i"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp > CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.i

CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.s"
	/home/libh/emscripten/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp -o CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.s

a_sources: CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_build_instance.cpp.o
a_sources: CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_inc.cpp.o
a_sources: CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_initialize.cpp.o
a_sources: CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_ls.cpp.o
a_sources: CMakeFiles/a_sources.dir/home/libh/emscripten/project/solver_src/sls_solver/nia_print.cpp.o
a_sources: CMakeFiles/a_sources.dir/build.make

.PHONY : a_sources

# Rule to build all files generated by this target.
CMakeFiles/a_sources.dir/build: a_sources

.PHONY : CMakeFiles/a_sources.dir/build

CMakeFiles/a_sources.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/a_sources.dir/cmake_clean.cmake
.PHONY : CMakeFiles/a_sources.dir/clean

CMakeFiles/a_sources.dir/depend:
	cd /home/libh/emscripten/project/amazon_video/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/libh/emscripten/project/amazon_video /home/libh/emscripten/project/amazon_video /home/libh/emscripten/project/amazon_video/build /home/libh/emscripten/project/amazon_video/build /home/libh/emscripten/project/amazon_video/build/CMakeFiles/a_sources.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/a_sources.dir/depend

