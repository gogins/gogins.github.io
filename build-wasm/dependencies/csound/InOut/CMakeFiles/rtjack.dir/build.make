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
include dependencies/csound/InOut/CMakeFiles/rtjack.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include dependencies/csound/InOut/CMakeFiles/rtjack.dir/compiler_depend.make

# Include the progress variables for this target.
include dependencies/csound/InOut/CMakeFiles/rtjack.dir/progress.make

# Include the compile flags for this target's objects.
include dependencies/csound/InOut/CMakeFiles/rtjack.dir/flags.make

dependencies/csound/InOut/CMakeFiles/rtjack.dir/rtjack.c.o: dependencies/csound/InOut/CMakeFiles/rtjack.dir/flags.make
dependencies/csound/InOut/CMakeFiles/rtjack.dir/rtjack.c.o: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut/rtjack.c
dependencies/csound/InOut/CMakeFiles/rtjack.dir/rtjack.c.o: dependencies/csound/InOut/CMakeFiles/rtjack.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object dependencies/csound/InOut/CMakeFiles/rtjack.dir/rtjack.c.o"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT dependencies/csound/InOut/CMakeFiles/rtjack.dir/rtjack.c.o -MF CMakeFiles/rtjack.dir/rtjack.c.o.d -o CMakeFiles/rtjack.dir/rtjack.c.o -c /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut/rtjack.c

dependencies/csound/InOut/CMakeFiles/rtjack.dir/rtjack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/rtjack.dir/rtjack.c.i"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut/rtjack.c > CMakeFiles/rtjack.dir/rtjack.c.i

dependencies/csound/InOut/CMakeFiles/rtjack.dir/rtjack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/rtjack.dir/rtjack.c.s"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut/rtjack.c -o CMakeFiles/rtjack.dir/rtjack.c.s

dependencies/csound/InOut/CMakeFiles/rtjack.dir/alphanumcmp.c.o: dependencies/csound/InOut/CMakeFiles/rtjack.dir/flags.make
dependencies/csound/InOut/CMakeFiles/rtjack.dir/alphanumcmp.c.o: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut/alphanumcmp.c
dependencies/csound/InOut/CMakeFiles/rtjack.dir/alphanumcmp.c.o: dependencies/csound/InOut/CMakeFiles/rtjack.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object dependencies/csound/InOut/CMakeFiles/rtjack.dir/alphanumcmp.c.o"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT dependencies/csound/InOut/CMakeFiles/rtjack.dir/alphanumcmp.c.o -MF CMakeFiles/rtjack.dir/alphanumcmp.c.o.d -o CMakeFiles/rtjack.dir/alphanumcmp.c.o -c /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut/alphanumcmp.c

dependencies/csound/InOut/CMakeFiles/rtjack.dir/alphanumcmp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/rtjack.dir/alphanumcmp.c.i"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut/alphanumcmp.c > CMakeFiles/rtjack.dir/alphanumcmp.c.i

dependencies/csound/InOut/CMakeFiles/rtjack.dir/alphanumcmp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/rtjack.dir/alphanumcmp.c.s"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut/alphanumcmp.c -o CMakeFiles/rtjack.dir/alphanumcmp.c.s

# Object files for target rtjack
rtjack_OBJECTS = \
"CMakeFiles/rtjack.dir/rtjack.c.o" \
"CMakeFiles/rtjack.dir/alphanumcmp.c.o"

# External object files for target rtjack
rtjack_EXTERNAL_OBJECTS =

dependencies/csound/librtjack.dylib: dependencies/csound/InOut/CMakeFiles/rtjack.dir/rtjack.c.o
dependencies/csound/librtjack.dylib: dependencies/csound/InOut/CMakeFiles/rtjack.dir/alphanumcmp.c.o
dependencies/csound/librtjack.dylib: dependencies/csound/InOut/CMakeFiles/rtjack.dir/build.make
dependencies/csound/librtjack.dylib: /opt/homebrew/lib/libjack.dylib
dependencies/csound/librtjack.dylib: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX15.0.sdk/usr/lib/libpthread.tbd
dependencies/csound/librtjack.dylib: dependencies/csound/InOut/CMakeFiles/rtjack.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/michaelgogins/cloud-5/build-wasm/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library ../librtjack.dylib"
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rtjack.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dependencies/csound/InOut/CMakeFiles/rtjack.dir/build: dependencies/csound/librtjack.dylib
.PHONY : dependencies/csound/InOut/CMakeFiles/rtjack.dir/build

dependencies/csound/InOut/CMakeFiles/rtjack.dir/clean:
	cd /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut && $(CMAKE_COMMAND) -P CMakeFiles/rtjack.dir/cmake_clean.cmake
.PHONY : dependencies/csound/InOut/CMakeFiles/rtjack.dir/clean

dependencies/csound/InOut/CMakeFiles/rtjack.dir/depend:
	cd /Users/michaelgogins/cloud-5/build-wasm && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/michaelgogins/cloud-5/csound-wasm-src /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut /Users/michaelgogins/cloud-5/build-wasm /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut /Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut/CMakeFiles/rtjack.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : dependencies/csound/InOut/CMakeFiles/rtjack.dir/depend
