# Install script for directory: /Users/michaelgogins/cloud-5/csound-wasm-src/dependencies/csound

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
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks" TYPE DIRECTORY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/CsoundLib.framework" USE_SOURCE_PERMISSIONS)
  if(EXISTS "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/CsoundLib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/CsoundLib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/CsoundLib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libCsoundLib.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib" TYPE STATIC_LIBRARY FILES "/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/libCsoundLib.a")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libCsoundLib.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libCsoundLib.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}/usr/local/lib/libCsoundLib.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/cmake/Csound/FindCsound.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/share/cmake/Csound" TYPE FILE FILES "/Users/michaelgogins/cloud-5/csound-wasm-src/cmake/Modules/FindCsound.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0/samples")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/Users/michaelgogins/Library/Frameworks/CsoundLib.framework/Versions/6.0" TYPE DIRECTORY FILES "/Users/michaelgogins/cloud-5/csound-wasm-src/samples")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/include/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Opcodes/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/InOut/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/interfaces/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Frontends/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/Bela/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/util1/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/po/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/tests/c/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/tests/commandline/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/tests/regression/cmake_install.cmake")
  include("/Users/michaelgogins/cloud-5/build-wasm/dependencies/csound/tests/soak/cmake_install.cmake")

endif()

