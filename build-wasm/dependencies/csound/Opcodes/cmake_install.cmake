# Install script for directory: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/Opcodes

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libdoppler.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libdoppler.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libdoppler.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libdoppler.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libdoppler.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libfractalnoise.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libfractalnoise.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libfractalnoise.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libfractalnoise.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libfractalnoise.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libftsamplebank.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libftsamplebank.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libftsamplebank.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libftsamplebank.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libftsamplebank.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/liblfsr.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/liblfsr.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/liblfsr.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/liblfsr.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/liblfsr.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libbformdec2.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libbformdec2.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libbformdec2.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libbformdec2.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libbformdec2.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libmixer.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libmixer.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libmixer.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libmixer.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libmixer.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libsignalflowgraph.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libsignalflowgraph.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libsignalflowgraph.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libsignalflowgraph.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libsignalflowgraph.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libampmidid.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libampmidid.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libampmidid.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libampmidid.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libampmidid.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libarrayops.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libarrayops.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libarrayops.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libarrayops.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libarrayops.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpvsops.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libpvsops.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpvsops.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpvsops.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpvsops.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libtrigenvsegs.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libtrigenvsegs.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libtrigenvsegs.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libtrigenvsegs.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libtrigenvsegs.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpadsynth.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libpadsynth.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpadsynth.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpadsynth.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpadsynth.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libscansyn.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libscansyn.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libscansyn.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libscansyn.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libscansyn.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libcontrol.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libcontrol.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libcontrol.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libcontrol.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libcontrol.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/liburandom.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/liburandom.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/liburandom.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/liburandom.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/liburandom.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libdeprecated.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libdeprecated.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libdeprecated.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libdeprecated.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libdeprecated.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

