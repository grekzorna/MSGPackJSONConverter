# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(taocpp-json_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(taocpp-json_FRAMEWORKS_FOUND_RELEASE "${taocpp-json_FRAMEWORKS_RELEASE}" "${taocpp-json_FRAMEWORK_DIRS_RELEASE}")

set(taocpp-json_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET taocpp-json_DEPS_TARGET)
    add_library(taocpp-json_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET taocpp-json_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${taocpp-json_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${taocpp-json_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:taocpp::pegtl>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### taocpp-json_DEPS_TARGET to all of them
conan_package_library_targets("${taocpp-json_LIBS_RELEASE}"    # libraries
                              "${taocpp-json_LIB_DIRS_RELEASE}" # package_libdir
                              "${taocpp-json_BIN_DIRS_RELEASE}" # package_bindir
                              "${taocpp-json_LIBRARY_TYPE_RELEASE}"
                              "${taocpp-json_IS_HOST_WINDOWS_RELEASE}"
                              taocpp-json_DEPS_TARGET
                              taocpp-json_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "taocpp-json"    # package_name
                              "${taocpp-json_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${taocpp-json_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT taocpp::json #############

        set(taocpp-json_taocpp_json_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(taocpp-json_taocpp_json_FRAMEWORKS_FOUND_RELEASE "${taocpp-json_taocpp_json_FRAMEWORKS_RELEASE}" "${taocpp-json_taocpp_json_FRAMEWORK_DIRS_RELEASE}")

        set(taocpp-json_taocpp_json_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET taocpp-json_taocpp_json_DEPS_TARGET)
            add_library(taocpp-json_taocpp_json_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET taocpp-json_taocpp_json_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'taocpp-json_taocpp_json_DEPS_TARGET' to all of them
        conan_package_library_targets("${taocpp-json_taocpp_json_LIBS_RELEASE}"
                              "${taocpp-json_taocpp_json_LIB_DIRS_RELEASE}"
                              "${taocpp-json_taocpp_json_BIN_DIRS_RELEASE}" # package_bindir
                              "${taocpp-json_taocpp_json_LIBRARY_TYPE_RELEASE}"
                              "${taocpp-json_taocpp_json_IS_HOST_WINDOWS_RELEASE}"
                              taocpp-json_taocpp_json_DEPS_TARGET
                              taocpp-json_taocpp_json_LIBRARIES_TARGETS
                              "_RELEASE"
                              "taocpp-json_taocpp_json"
                              "${taocpp-json_taocpp_json_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET taocpp::json
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_LIBRARIES_TARGETS}>
                     )

        if("${taocpp-json_taocpp_json_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET taocpp::json
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         taocpp-json_taocpp_json_DEPS_TARGET)
        endif()

        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_LIB_DIRS_RELEASE}>)
        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${taocpp-json_taocpp_json_COMPILE_OPTIONS_RELEASE}>)


    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET taocpp::json APPEND PROPERTY INTERFACE_LINK_LIBRARIES taocpp::json)

########## For the modules (FindXXX)
set(taocpp-json_LIBRARIES_RELEASE taocpp::json)
