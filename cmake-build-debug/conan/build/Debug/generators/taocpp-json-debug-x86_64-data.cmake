########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND taocpp-json_COMPONENT_NAMES taocpp::json)
list(REMOVE_DUPLICATES taocpp-json_COMPONENT_NAMES)
if(DEFINED taocpp-json_FIND_DEPENDENCY_NAMES)
  list(APPEND taocpp-json_FIND_DEPENDENCY_NAMES pegtl)
  list(REMOVE_DUPLICATES taocpp-json_FIND_DEPENDENCY_NAMES)
else()
  set(taocpp-json_FIND_DEPENDENCY_NAMES pegtl)
endif()
set(pegtl_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(taocpp-json_PACKAGE_FOLDER_DEBUG "C:/Users/Dell/.conan2/p/taocp84aef767d5bc6/p")
set(taocpp-json_BUILD_MODULES_PATHS_DEBUG )


set(taocpp-json_INCLUDE_DIRS_DEBUG "${taocpp-json_PACKAGE_FOLDER_DEBUG}/include")
set(taocpp-json_RES_DIRS_DEBUG )
set(taocpp-json_DEFINITIONS_DEBUG )
set(taocpp-json_SHARED_LINK_FLAGS_DEBUG )
set(taocpp-json_EXE_LINK_FLAGS_DEBUG )
set(taocpp-json_OBJECTS_DEBUG )
set(taocpp-json_COMPILE_DEFINITIONS_DEBUG )
set(taocpp-json_COMPILE_OPTIONS_C_DEBUG )
set(taocpp-json_COMPILE_OPTIONS_CXX_DEBUG )
set(taocpp-json_LIB_DIRS_DEBUG )
set(taocpp-json_BIN_DIRS_DEBUG )
set(taocpp-json_LIBRARY_TYPE_DEBUG UNKNOWN)
set(taocpp-json_IS_HOST_WINDOWS_DEBUG 1)
set(taocpp-json_LIBS_DEBUG )
set(taocpp-json_SYSTEM_LIBS_DEBUG )
set(taocpp-json_FRAMEWORK_DIRS_DEBUG )
set(taocpp-json_FRAMEWORKS_DEBUG )
set(taocpp-json_BUILD_DIRS_DEBUG )
set(taocpp-json_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(taocpp-json_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${taocpp-json_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${taocpp-json_COMPILE_OPTIONS_C_DEBUG}>")
set(taocpp-json_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${taocpp-json_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${taocpp-json_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${taocpp-json_EXE_LINK_FLAGS_DEBUG}>")


set(taocpp-json_COMPONENTS_DEBUG taocpp::json)
########### COMPONENT taocpp::json VARIABLES ############################################

set(taocpp-json_taocpp_json_INCLUDE_DIRS_DEBUG "${taocpp-json_PACKAGE_FOLDER_DEBUG}/include")
set(taocpp-json_taocpp_json_LIB_DIRS_DEBUG )
set(taocpp-json_taocpp_json_BIN_DIRS_DEBUG )
set(taocpp-json_taocpp_json_LIBRARY_TYPE_DEBUG UNKNOWN)
set(taocpp-json_taocpp_json_IS_HOST_WINDOWS_DEBUG 1)
set(taocpp-json_taocpp_json_RES_DIRS_DEBUG )
set(taocpp-json_taocpp_json_DEFINITIONS_DEBUG )
set(taocpp-json_taocpp_json_OBJECTS_DEBUG )
set(taocpp-json_taocpp_json_COMPILE_DEFINITIONS_DEBUG )
set(taocpp-json_taocpp_json_COMPILE_OPTIONS_C_DEBUG "")
set(taocpp-json_taocpp_json_COMPILE_OPTIONS_CXX_DEBUG "")
set(taocpp-json_taocpp_json_LIBS_DEBUG )
set(taocpp-json_taocpp_json_SYSTEM_LIBS_DEBUG )
set(taocpp-json_taocpp_json_FRAMEWORK_DIRS_DEBUG )
set(taocpp-json_taocpp_json_FRAMEWORKS_DEBUG )
set(taocpp-json_taocpp_json_DEPENDENCIES_DEBUG taocpp::pegtl)
set(taocpp-json_taocpp_json_SHARED_LINK_FLAGS_DEBUG )
set(taocpp-json_taocpp_json_EXE_LINK_FLAGS_DEBUG )
set(taocpp-json_taocpp_json_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(taocpp-json_taocpp_json_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${taocpp-json_taocpp_json_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${taocpp-json_taocpp_json_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${taocpp-json_taocpp_json_EXE_LINK_FLAGS_DEBUG}>
)
set(taocpp-json_taocpp_json_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${taocpp-json_taocpp_json_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${taocpp-json_taocpp_json_COMPILE_OPTIONS_C_DEBUG}>")