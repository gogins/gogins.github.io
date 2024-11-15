# Install script for directory: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound/InOut

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
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libcmidi.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libcmidi.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libcmidi.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libcmidi.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libcmidi.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/librtauhal.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/librtauhal.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/librtauhal.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/librtauhal.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/librtauhal.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpmidi.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libpmidi.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpmidi.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpmidi.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libpmidi.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libipmidi.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libipmidi.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libipmidi.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libipmidi.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/libipmidi.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/librtjack.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes" TYPE SHARED_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/librtjack.dylib")
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/librtjack.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/librtjack.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/Resources/Opcodes/librtjack.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

