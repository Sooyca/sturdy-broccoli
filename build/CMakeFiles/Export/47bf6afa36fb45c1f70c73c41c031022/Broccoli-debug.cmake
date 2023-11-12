#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "sturdy-broccoli" for configuration "Debug"
set_property(TARGET sturdy-broccoli APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(sturdy-broccoli PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libsturdy-broccoli.so"
  IMPORTED_SONAME_DEBUG "libsturdy-broccoli.so"
  )

list(APPEND _cmake_import_check_targets sturdy-broccoli )
list(APPEND _cmake_import_check_files_for_sturdy-broccoli "${_IMPORT_PREFIX}/lib/libsturdy-broccoli.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
