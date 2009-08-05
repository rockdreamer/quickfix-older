# Look for a directory containing STLPort.
#
# The following values are defined
# STLPORT_INCLUDE_DIR - where to find vector, etc.
# STLPORT_LIBRARIES   - link against these to use STLPort
# STLPORT_FOUND       - True if the X11 extensions are available.

# custom positions per telefeed
set (TASTOOLS_ROOT "$ENV{TASTOOLS_ROOT}")
if (NOT TASTOOLS_ROOT)
	message(ERROR "Environment variable TASTOOLS_ROOT is not set, check configuration")
endif (NOT TASTOOLS_ROOT)


# Assume for the moment that the STLPORT_INSTALL directory contains
# both the subdirectory for header file includes (.../stlport) and
# the subdirectory for libraries (../lib).

FIND_PATH( STLPORT_INCLUDE_DIR iostream
   ${TASTOOLS_ROOT}/../stlport
   ${TASTOOLS_ROOT}/stlport
   ${TASTOOLS_ROOT}/../stlport/stlport
   ${TASTOOLS_ROOT}/stlport/stlport
   ${TASTOOLS_ROOT}/stlport-5.1.1
   ${TASTOOLS_ROOT}
)
message("STLPORT_INCLUDE_DIR is " ${STLPORT_INCLUDE_DIR})

IF(CMAKE_BUILD_TYPE MATCHES "Debug")
  # "Debug" probably means we do not want the non-debug ones.
  FIND_LIBRARY( STLPORT_LIBRARIES
    NAMES 
		stlport_cygwin_debug
		stlport_cygwin_stldebug
		stlport_gcc_debug
		stlport_gcc_stldebug
		stlportd
		stlportstld.5.1
		stlport #ultima spiaggia
    PATHS 
   ${TASTOOLS_ROOT}/lib
   ${TASTOOLS_ROOT}/stlport/lib
   ${TASTOOLS_ROOT}/../stlport/lib
  )
  message("STLPORT_LIBRARIES is " ${STLPORT_LIBRARIES} " (debug)")

ELSE(CMAKE_BUILD_TYPE MATCHES "Debug")
  # if we only have debug libraries, use them.
  # that is surely better than nothing.
  FIND_LIBRARY( STLPORT_LIBRARIES
    NAMES
		stlport_cygwin
        stlport_cygwin_debug
        stlport_cygwin_stldebug
        stlport_gcc
        stlport_gcc_debug
        stlport_gcc_stldebug
		stlport
		stlport.5.1
		PATHS
   ${TASTOOLS_ROOT}/lib
   ${TASTOOLS_ROOT}/stlport/lib
   ${TASTOOLS_ROOT}/../stlport/lib
  )
  message("STLPORT_LIBRARIES is " ${STLPORT_LIBRARIES})

ENDIF(CMAKE_BUILD_TYPE MATCHES "Debug")


#
# For GCC, should we consider using -nostdinc or -isystem to 
# point to the STLPort system header directory? It is quite
# important that we get the STLPort C++ header files and not
# those that come with GCC.
#


IF( STLPORT_INCLUDE_DIR )
  IF( STLPORT_LIBRARIES )
    SET( STLPORT_FOUND "YES" )

    # stlport_gcc needs pthread.
    IF(UNIX)
      SET( STLPORT_LIBRARIES
        ${STLPORT_LIBRARIES} pthread )
    ENDIF(UNIX)

  ENDIF( STLPORT_LIBRARIES )
ENDIF( STLPORT_INCLUDE_DIR )

MARK_AS_ADVANCED(
  STLPORT_INCLUDE_DIR
  STLPORT_LIBRARIES
)
