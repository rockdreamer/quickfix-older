include (CheckFunctionExists)

message(STATUS "compiler is " ${CMAKE_C_COMPILER})
if("${CMAKE_C_COMPILER}" MATCHES "gcc")
	message(STATUS "adding -shared-libgcc " ${CMAKE_C_COMPILER})
        set(COMMON_CXX_FLAGS ${COMMON_CXX_FLAGS} -shared-libgcc -Wall -ansi -Wpointer-arith -Wwrite-strings)
        set(COMMON_LINKER_FLAGS ${COMMON_LINKER_FLAGS} -shared-libgcc)
endif("${CMAKE_C_COMPILER}" MATCHES "gcc")
if("${CMAKE_C_COMPILER}" MATCHES "cl")
		message(STATUS "Found cl: adding /W3, /GL and /VERBOSE:LIB to " ${CMAKE_C_COMPILER})
        set(COMMON_CXX_FLAGS ${COMMON_CXX_FLAGS} "/W3 /wd4290 /GL")
        set(COMMON_LINKER_FLAGS ${COMMON_LINKER_FLAGS} "/VERBOSE:LIB" )
endif()

if(UNIX)
	add_definitions(-D__UNIX__)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "AIX")
	add_definitions(-D__AIX__)
	# AIX is missing iconv from libc, so we add it separately
	FIND_PATH( ICONV_INCLUDE_DIR NAMES iconv.h )
	MARK_AS_ADVANCED( ICONV_INCLUDE_DIR )
	FIND_LIBRARY( ICONV_LIBRARY NAMES iconv )
	MARK_AS_ADVANCED( ICONV_LIBRARY )
	SET(EXECLIBS ${EXECLIBS} ${ICONV_LIBRARY} )
endif("${CMAKE_SYSTEM_NAME}" STREQUAL "AIX")

if (${CMAKE_SYSTEM_NAME} STREQUAL Linux)
        add_definitions(-D__LINUX__)
endif (${CMAKE_SYSTEM_NAME} STREQUAL Linux)

endif(UNIX)


if(WIN32)
	add_definitions(-DWIN32)
	add_definitions(-D_CONSOLE)
	add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
	set(COMMONLIBS ${COMMONLIBS} wsock32)
	if("${CMAKE_C_COMPILER}" MATCHES "gcc")
		add_definitions(-D_CYGWIN_)
	endif()
endif(WIN32)

add_definitions(-D_REENTRANT)

if (CMAKE_BUILD_TYPE MATCHES "Debug")
#	add_definitions(-D_DEBUG)
endif (CMAKE_BUILD_TYPE MATCHES "Debug")

if (QF_WITH_NEW_ALLOCATOR)
add_definitions(-DENABLE_NEW_ALLOCATOR)
endif()

if (QF_WITH_CALLSTACK)
add_definitions(-DENABLE_CALLSTACK)
endif()

if (QF_WITH_BOOST)
add_definitions(-DHAVE_BOOST)
endif()

if (QF_WITH_MYSQL)
add_definitions(-DHAVE_MYSQL)
endif()

if (QF_WITH_POSTGRESQL)
add_definitions(-DHAVE_POSTGRESQL)
endif()

if (QF_WITH_PYTHON)
add_definitions(-DHAVE_PYTHON)
endif()

if (QF_WITH_RUBY)
add_definitions(-DHAVE_RUBY)
endif()

if (QF_WITH_JAVA)
add_definitions(-DHAVE_JAVA)
endif()

if (QF_WITH_STLPORT)
add_definitions(-DHAVE_STLPORT)
endif()
