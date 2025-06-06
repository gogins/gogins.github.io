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
include dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/compiler_depend.make

# Include the progress variables for this target.
include dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/progress.make

# Include the compile flags for this target's objects.
include dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/flags.make

dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansyn.c.o: dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/flags.make
dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansyn.c.o: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/scansyn.c
dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansyn.c.o: dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansyn.c.o"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansyn.c.o -MF CMakeFiles/scansyn.dir/scansyn.c.o.d -o CMakeFiles/scansyn.dir/scansyn.c.o -c /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/scansyn.c

dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansyn.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/scansyn.dir/scansyn.c.i"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/scansyn.c > CMakeFiles/scansyn.dir/scansyn.c.i

dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansyn.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/scansyn.dir/scansyn.c.s"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/scansyn.c -o CMakeFiles/scansyn.dir/scansyn.c.s

dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansynx.c.o: dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/flags.make
dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansynx.c.o: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/scansynx.c
dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansynx.c.o: dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansynx.c.o"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansynx.c.o -MF CMakeFiles/scansyn.dir/scansynx.c.o.d -o CMakeFiles/scansyn.dir/scansynx.c.o -c /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/scansynx.c

dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansynx.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/scansyn.dir/scansynx.c.i"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/scansynx.c > CMakeFiles/scansyn.dir/scansynx.c.i

dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansynx.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/scansyn.dir/scansynx.c.s"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes/scansynx.c -o CMakeFiles/scansyn.dir/scansynx.c.s

# Object files for target scansyn
scansyn_OBJECTS = \
"CMakeFiles/scansyn.dir/scansyn.c.o" \
"CMakeFiles/scansyn.dir/scansynx.c.o"

# External object files for target scansyn
scansyn_EXTERNAL_OBJECTS =

dependencies/csound/libscansyn.dylib: dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansyn.c.o
dependencies/csound/libscansyn.dylib: dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/scansynx.c.o
dependencies/csound/libscansyn.dylib: dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/build.make
dependencies/csound/libscansyn.dylib: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.0.sdk/usr/lib/libm.tbd
dependencies/csound/libscansyn.dylib: dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library ../libscansyn.dylib"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/scansyn.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/build: dependencies/csound/libscansyn.dylib
.PHONY : dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/build

dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/clean:
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes && $(CMAKE_COMMAND) -P CMakeFiles/scansyn.dir/cmake_clean.cmake
.PHONY : dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/clean

dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/depend:
	cd /Users/michaelgogins/cloud-5/build-wasm && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/michaelgogins/cloud-5/csound-wasm-src /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes /Users/michaelgogins/cloud-5/build-wasm /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : dependencies/csound/Opcodes/CMakeFiles/scansyn.dir/depend

