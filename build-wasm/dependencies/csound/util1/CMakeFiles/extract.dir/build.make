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
include dependencies/csound/util1/CMakeFiles/extract.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include dependencies/csound/util1/CMakeFiles/extract.dir/compiler_depend.make

# Include the progress variables for this target.
include dependencies/csound/util1/CMakeFiles/extract.dir/progress.make

# Include the compile flags for this target's objects.
include dependencies/csound/util1/CMakeFiles/extract.dir/flags.make

dependencies/csound/util1/CMakeFiles/extract.dir/sortex/xmain.c.o: dependencies/csound/util1/CMakeFiles/extract.dir/flags.make
dependencies/csound/util1/CMakeFiles/extract.dir/sortex/xmain.c.o: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/util1/sortex/xmain.c
dependencies/csound/util1/CMakeFiles/extract.dir/sortex/xmain.c.o: dependencies/csound/util1/CMakeFiles/extract.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object dependencies/csound/util1/CMakeFiles/extract.dir/sortex/xmain.c.o"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util1 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT dependencies/csound/util1/CMakeFiles/extract.dir/sortex/xmain.c.o -MF CMakeFiles/extract.dir/sortex/xmain.c.o.d -o CMakeFiles/extract.dir/sortex/xmain.c.o -c /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/util1/sortex/xmain.c

dependencies/csound/util1/CMakeFiles/extract.dir/sortex/xmain.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/extract.dir/sortex/xmain.c.i"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util1 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/util1/sortex/xmain.c > CMakeFiles/extract.dir/sortex/xmain.c.i

dependencies/csound/util1/CMakeFiles/extract.dir/sortex/xmain.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/extract.dir/sortex/xmain.c.s"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util1 && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/util1/sortex/xmain.c -o CMakeFiles/extract.dir/sortex/xmain.c.s

# Object files for target extract
extract_OBJECTS = \
"CMakeFiles/extract.dir/sortex/xmain.c.o"

# External object files for target extract
extract_EXTERNAL_OBJECTS =

dependencies/csound/extract: dependencies/csound/util1/CMakeFiles/extract.dir/sortex/xmain.c.o
dependencies/csound/extract: dependencies/csound/util1/CMakeFiles/extract.dir/build.make
dependencies/csound/extract: dependencies/csound/CsoundLib.framework/Versions/6.0/CsoundLib
dependencies/csound/extract: dependencies/csound/util1/CMakeFiles/extract.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../extract"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/extract.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dependencies/csound/util1/CMakeFiles/extract.dir/build: dependencies/csound/extract
.PHONY : dependencies/csound/util1/CMakeFiles/extract.dir/build

dependencies/csound/util1/CMakeFiles/extract.dir/clean:
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util1 && $(CMAKE_COMMAND) -P CMakeFiles/extract.dir/cmake_clean.cmake
.PHONY : dependencies/csound/util1/CMakeFiles/extract.dir/clean

dependencies/csound/util1/CMakeFiles/extract.dir/depend:
	cd /Users/michaelgogins/cloud-5/build-wasm && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/michaelgogins/cloud-5/csound-wasm-src /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/util1 /Users/michaelgogins/cloud-5/build-wasm /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util1 /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util1/CMakeFiles/extract.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : dependencies/csound/util1/CMakeFiles/extract.dir/depend

