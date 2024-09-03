cmake_minimum_required(VERSION 3.5)
project(cloud-5)
include(ExternalProject)

set(CSOUND_WASM_SOURCE_DIR ${CMAKE_SOURCE_DIR}/csound-wasm-src)
ExternalProject_Add(csound-wasm
    PREFIX ${CMAKE_SOURCE_DIR}/csound-wasm
    GIT_REPOSITORY https://github.com/gogins/csound-wasm.git
    GIT_TAG main 
    SOURCE_DIR ${CSOUND_WASM_SOURCE_DIR}
    BINARY_DIR ${CMAKE_SOURCE_DIR}/build-wasm
    BUILD_COMMAND cd ${CSOUND_WASM_SOURCE_DIR} && ${CSOUND_WASM_SOURCE_DIR}/download_libsndfile_wasm.sh && ${CSOUND_WASM_SOURCE_DIR}/build_libsndfile_wasm.sh && ${CSOUND_WASM_SOURCE_DIR}/build-wasm.sh
    BUILD_ALWAYS OFF
    # We use the targets built in place.
    INSTALL_COMMAND ""
)

set(CSOUND_NODE_SOURCE_DIR ${CMAKE_SOURCE_DIR}/csound-node-src)
ExternalProject_Add(csound-node
    PREFIX ${CMAKE_SOURCE_DIR}/csound-node
    GIT_REPOSITORY https://github.com/gogins/csound-extended-node.git
    GIT_TAG main 
    SOURCE_DIR ${CSOUND_NODE_SOURCE_DIR}
    BUILD_ALWAYS OFF
    # We use the targets built in place.
    INSTALL_COMMAND ""
)


