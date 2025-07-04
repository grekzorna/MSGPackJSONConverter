# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/pegtl-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${taocpp-pegtl_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${pegtl_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET taocpp::pegtl)
    add_library(taocpp::pegtl INTERFACE IMPORTED)
    message(${pegtl_MESSAGE_MODE} "Conan: Target declared 'taocpp::pegtl'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/pegtl-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()