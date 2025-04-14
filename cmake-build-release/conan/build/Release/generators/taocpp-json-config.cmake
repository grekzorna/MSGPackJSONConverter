########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(taocpp-json_FIND_QUIETLY)
    set(taocpp-json_MESSAGE_MODE VERBOSE)
else()
    set(taocpp-json_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/taocpp-jsonTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${taocpp-json_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(taocpp-json_VERSION_STRING "1.0.0-beta.14")
set(taocpp-json_INCLUDE_DIRS ${taocpp-json_INCLUDE_DIRS_RELEASE} )
set(taocpp-json_INCLUDE_DIR ${taocpp-json_INCLUDE_DIRS_RELEASE} )
set(taocpp-json_LIBRARIES ${taocpp-json_LIBRARIES_RELEASE} )
set(taocpp-json_DEFINITIONS ${taocpp-json_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${taocpp-json_BUILD_MODULES_PATHS_RELEASE} )
    message(${taocpp-json_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


