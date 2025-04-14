# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(taocpp-pegtl_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(taocpp-pegtl_FRAMEWORKS_FOUND_RELEASE "${taocpp-pegtl_FRAMEWORKS_RELEASE}" "${taocpp-pegtl_FRAMEWORK_DIRS_RELEASE}")

set(taocpp-pegtl_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET taocpp-pegtl_DEPS_TARGET)
    add_library(taocpp-pegtl_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET taocpp-pegtl_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${taocpp-pegtl_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${taocpp-pegtl_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### taocpp-pegtl_DEPS_TARGET to all of them
conan_package_library_targets("${taocpp-pegtl_LIBS_RELEASE}"    # libraries
                              "${taocpp-pegtl_LIB_DIRS_RELEASE}" # package_libdir
                              "${taocpp-pegtl_BIN_DIRS_RELEASE}" # package_bindir
                              "${taocpp-pegtl_LIBRARY_TYPE_RELEASE}"
                              "${taocpp-pegtl_IS_HOST_WINDOWS_RELEASE}"
                              taocpp-pegtl_DEPS_TARGET
                              taocpp-pegtl_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "taocpp-pegtl"    # package_name
                              "${taocpp-pegtl_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${taocpp-pegtl_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT taocpp::pegtl #############

        set(taocpp-pegtl_taocpp_pegtl_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(taocpp-pegtl_taocpp_pegtl_FRAMEWORKS_FOUND_RELEASE "${taocpp-pegtl_taocpp_pegtl_FRAMEWORKS_RELEASE}" "${taocpp-pegtl_taocpp_pegtl_FRAMEWORK_DIRS_RELEASE}")

        set(taocpp-pegtl_taocpp_pegtl_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET taocpp-pegtl_taocpp_pegtl_DEPS_TARGET)
            add_library(taocpp-pegtl_taocpp_pegtl_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET taocpp-pegtl_taocpp_pegtl_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'taocpp-pegtl_taocpp_pegtl_DEPS_TARGET' to all of them
        conan_package_library_targets("${taocpp-pegtl_taocpp_pegtl_LIBS_RELEASE}"
                              "${taocpp-pegtl_taocpp_pegtl_LIB_DIRS_RELEASE}"
                              "${taocpp-pegtl_taocpp_pegtl_BIN_DIRS_RELEASE}" # package_bindir
                              "${taocpp-pegtl_taocpp_pegtl_LIBRARY_TYPE_RELEASE}"
                              "${taocpp-pegtl_taocpp_pegtl_IS_HOST_WINDOWS_RELEASE}"
                              taocpp-pegtl_taocpp_pegtl_DEPS_TARGET
                              taocpp-pegtl_taocpp_pegtl_LIBRARIES_TARGETS
                              "_RELEASE"
                              "taocpp-pegtl_taocpp_pegtl"
                              "${taocpp-pegtl_taocpp_pegtl_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET taocpp::pegtl
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_LIBRARIES_TARGETS}>
                     )

        if("${taocpp-pegtl_taocpp_pegtl_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET taocpp::pegtl
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         taocpp-pegtl_taocpp_pegtl_DEPS_TARGET)
        endif()

        set_property(TARGET taocpp::pegtl APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET taocpp::pegtl APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET taocpp::pegtl APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_LIB_DIRS_RELEASE}>)
        set_property(TARGET taocpp::pegtl APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET taocpp::pegtl APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${taocpp-pegtl_taocpp_pegtl_COMPILE_OPTIONS_RELEASE}>)


    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET taocpp::pegtl APPEND PROPERTY INTERFACE_LINK_LIBRARIES taocpp::pegtl)

########## For the modules (FindXXX)
set(taocpp-pegtl_LIBRARIES_RELEASE taocpp::pegtl)
