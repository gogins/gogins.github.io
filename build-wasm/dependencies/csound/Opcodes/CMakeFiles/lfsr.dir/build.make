# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/michaelgogins/cloud-5/csound-wasm-src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/michaelgogins/cloud-5/build-wasm

# Include any dependencies generated for this target.
include dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/compiler_depend.make

# Include the progress variables for this target.
include dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/progress.make

# Include the compile flags for this target's objects.
include dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/flags.make

dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/lfsr.cpp.o: dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/flags.make
dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/lfsr.cpp.o: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/lfsr.cpp
dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/lfsr.cpp.o: dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/lfsr.cpp.o"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/lfsr.cpp.o -MF CMakeFiles/lfsr.dir/lfsr.cpp.o.d -o CMakeFiles/lfsr.dir/lfsr.cpp.o -c /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/lfsr.cpp

dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/lfsr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/lfsr.dir/lfsr.cpp.i"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/lfsr.cpp > CMakeFiles/lfsr.dir/lfsr.cpp.i

dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/lfsr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/lfsr.dir/lfsr.cpp.s"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/lfsr.cpp -o CMakeFiles/lfsr.dir/lfsr.cpp.s

# Object files for target lfsr
lfsr_OBJECTS = \
"CMakeFiles/lfsr.dir/lfsr.cpp.o"

# External object files for target lfsr
lfsr_EXTERNAL_OBJECTS =

dependencies/csound/liblfsr.dylib: dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/lfsr.cpp.o
dependencies/csound/liblfsr.dylib: dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/build.make
dependencies/csound/liblfsr.dylib: dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../liblfsr.dylib"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lfsr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/build: dependencies/csound/liblfsr.dylib
.PHONY : dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/build

dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/clean:
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && $(CMAKE_COMMAND) -P CMakeFiles/lfsr.dir/cmake_clean.cmake
.PHONY : dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/clean

dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/depend:
	cd /Users/michaelgogins/cloud-5/build-wasm && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/michaelgogins/cloud-5/csound-wasm-src /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes /Users/michaelgogins/cloud-5/build-wasm /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : dependencies/csound/Opcodes/CMakeFiles/lfsr.dir/depend
