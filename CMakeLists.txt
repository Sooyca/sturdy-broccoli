# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project (sturdy-broccoli)

# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    src/sturdy-broccoli.cpp
)

# Add an executable with the above sources
add_library(sturdy-broccoli SHARED ${SOURCES})

find_package(SDL2 REQUIRED)
target_link_libraries(sturdy-broccoli PUBLIC $<BUILD_INTERFACE:SDL2::SDL2>)

target_include_directories(sturdy-broccoli PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
    ${SDL2_INCLUDE_DIRS}
)

install(TARGETS sturdy-broccoli EXPORT BroccoliTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install(DIRECTORY include/ DESTINATION include)
install(EXPORT BroccoliTargets FILE BroccoliConfig.cmake DESTINATION lib/cmake/Broccoli)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    BroccoliConfig.cmake
    VERSION 0.1
    COMPATIBILITY AnyNewerVersion
)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/BroccoliConfig.cmake"
    DESTINATION lib/cmake/Broccoli
)

install(FILES "${CMAKE_SOURCE_DIR}/cmake-modules/BroccoliModule.cmake"
        DESTINATION cmake-modules/
)