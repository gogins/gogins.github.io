# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

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
CMAKE_SOURCE_DIR = /Users/michaelgogins/cloud-5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/michaelgogins/cloud-5

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake cache editor..."
	/Applications/CMake.app/Contents/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --cyan "Running CMake to regenerate build system..."
	/Applications/CMake.app/Contents/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/michaelgogins/cloud-5/CMakeFiles /Users/michaelgogins/cloud-5//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/michaelgogins/cloud-5/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named csound-wasm-updated

# Build rule for target.
csound-wasm-updated: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 csound-wasm-updated
.PHONY : csound-wasm-updated

# fast build rule for target.
csound-wasm-updated/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/csound-wasm-updated.dir/build.make CMakeFiles/csound-wasm-updated.dir/build
.PHONY : csound-wasm-updated/fast

#=============================================================================
# Target rules for targets named csound-wasm

# Build rule for target.
csound-wasm: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 csound-wasm
.PHONY : csound-wasm

# fast build rule for target.
csound-wasm/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/csound-wasm.dir/build.make CMakeFiles/csound-wasm.dir/build
.PHONY : csound-wasm/fast

#=============================================================================
# Target rules for targets named csound-node-updated

# Build rule for target.
csound-node-updated: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 csound-node-updated
.PHONY : csound-node-updated

# fast build rule for target.
csound-node-updated/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/csound-node-updated.dir/build.make CMakeFiles/csound-node-updated.dir/build
.PHONY : csound-node-updated/fast

#=============================================================================
# Target rules for targets named csound-node

# Build rule for target.
csound-node: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 csound-node
.PHONY : csound-node

# fast build rule for target.
csound-node/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/csound-node.dir/build.make CMakeFiles/csound-node.dir/build
.PHONY : csound-node/fast

#=============================================================================
# Target rules for targets named strudel

# Build rule for target.
strudel: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 strudel
.PHONY : strudel

# fast build rule for target.
strudel/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/strudel.dir/build.make CMakeFiles/strudel.dir/build
.PHONY : strudel/fast

#=============================================================================
# Target rules for targets named vscode-playpen

# Build rule for target.
vscode-playpen: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 vscode-playpen
.PHONY : vscode-playpen

# fast build rule for target.
vscode-playpen/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/vscode-playpen.dir/build.make CMakeFiles/vscode-playpen.dir/build
.PHONY : vscode-playpen/fast

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... csound-node"
	@echo "... csound-node-updated"
	@echo "... csound-wasm"
	@echo "... csound-wasm-updated"
	@echo "... strudel"
	@echo "... vscode-playpen"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system
