# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(taocpp-json_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(taocpp-json_FRAMEWORKS_FOUND_DEBUG "${taocpp-json_FRAMEWORKS_DEBUG}" "${taocpp-json_FRAMEWORK_DIRS_DEBUG}")

set(taocpp-json_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET taocpp-json_DEPS_TARGET)
    add_library(taocpp-json_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET taocpp-json_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${taocpp-json_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${taocpp-json_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:taocpp::pegtl>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### taocpp-json_DEPS_TARGET to all of them
conan_package_library_targets("${taocpp-json_LIBS_DEBUG}"    # libraries
                              "${taocpp-json_LIB_DIRS_DEBUG}" # package_libdir
                              "${taocpp-json_BIN_DIRS_DEBUG}" # package_bindir
                              "${taocpp-json_LIBRARY_TYPE_DEBUG}"
                              "${taocpp-json_IS_HOST_WINDOWS_DEBUG}"
                              taocpp-json_DEPS_TARGET
                              taocpp-json_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "taocpp-json"    # package_name
                              "${taocpp-json_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${taocpp-json_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT taocpp::json #############

        set(taocpp-json_taocpp_json_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(taocpp-json_taocpp_json_FRAMEWORKS_FOUND_DEBUG "${taocpp-json_taocpp_json_FRAMEWORKS_DEBUG}" "${taocpp-json_taocpp_json_FRAMEWORK_DIRS_DEBUG}")

        set(taocpp-json_taocpp_json_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET taocpp-json_taocpp_json_DEPS_TARGET)
            add_library(taocpp-json_taocpp_json_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET taocpp-json_taocpp_json_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_DEPENDENCIES_DEBUG}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'taocpp-json_taocpp_json_DEPS_TARGET' to all of them
        conan_package_library_targets("${taocpp-json_taocpp_json_LIBS_DEBUG}"
                              "${taocpp-json_taocpp_json_LIB_DIRS_DEBUG}"
                              "${taocpp-json_taocpp_json_BIN_DIRS_DEBUG}" # package_bindir
                              "${taocpp-json_taocpp_json_LIBRARY_TYPE_DEBUG}"
                              "${taocpp-json_taocpp_json_IS_HOST_WINDOWS_DEBUG}"
                              taocpp-json_taocpp_json_DEPS_TARGET
                              taocpp-json_taocpp_json_LIBRARIES_TARGETS
                              "_DEBUG"
                              "taocpp-json_taocpp_json"
                              "${taocpp-json_taocpp_json_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET taocpp::json
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_LIBRARIES_TARGETS}>
                     )

        if("${taocpp-json_taocpp_json_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET taocpp::json
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         taocpp-json_taocpp_json_DEPS_TARGET)
        endif()

        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_LINKER_FLAGS_DEBUG}>)
        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_INCLUDE_DIRS_DEBUG}>)
        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_LIB_DIRS_DEBUG}>)
        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_COMPILE_DEFINITIONS_DEBUG}>)
        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${taocpp-json_taocpp_json_COMPILE_OPTIONS_DEBUG}>)


    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_LINK_LIBRARIES taocpp::json)

########## For the modules (FindXXX)
set(taocpp-json_LIBRARIES_DEBUG taocpp::json)
