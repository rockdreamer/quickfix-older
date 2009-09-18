include (CheckFunctionExists)
include (CheckCXXSourceCompiles)

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
	add_definitions(-DUNITTEST_POSIX)

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

find_file(stdio.h HAVE_STDIO_H)

try_compile(
    attstreams_result
    ${CMAKE_CURRENT_BINARY_DIR}/CMakeTmp
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/testattstreams.cpp
    OUTPUT_VARIABLE attstreams_output)
if (attstreams_result)
set(USING_STREAMS 1)
message(STATUS "Building with AT&T Streams")
else()
message(STATUS "Building without AT&T Streams")
endif()

try_compile(
    socklent_result
    ${CMAKE_CURRENT_BINARY_DIR}/CMakeTmp
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/testsocklent.cpp
    OUTPUT_VARIABLE socklent_output)
if (socklent_result)
message(STATUS "socklen_t is defined")
else()
set(socklen_t int)
message(STATUS "socklen_t is undefined, defaulting to int")
endif()

check_function_exists(ftime HAVE_FTIME)

check_cxx_source_compiles("
#include <exception>
void term() {};
int main(int argc, char** argv){ set_terminate(term); return 0;}"
GLOBAL_SET_TERMINATE)
if (GLOBAL_SET_TERMINATE)
	message(STATUS "set_terminate is global")
else()
	message(STATUS "set_terminate is not global")
	check_cxx_source_compiles("
	#include <exception>
	void term() {};
	int main(int argc, char** argv){ std::set_terminate(term); return 0;}"
	STD_SET_TERMINATE)
	if (STD_SET_TERMINATE)
		set(TERMINATE_IN_STD 1)
		message(STATUS "set_terminate is available in std::")
	else()
		message(FATAL "set_terminate is not available in std::, cannot proceed")
	endif()

endif()

check_cxx_source_compiles("
#include <typeinfo>
int main(int argc, char** argv){ const typeinfo& ty = typeid(typeinfo); return 0;}"
GLOBAL_TYPEINFO)
if (GLOBAL_TYPEINFO)
	message(STATUS "typeinfo is global")
else()
	message(STATUS "typeinfo is not global")
	check_cxx_source_compiles("
	#include <typeinfo>
	int main(int argc, char** argv){ const std::type_info& ty = typeid(std::type_info); return 0;}"
	STD_TYPEINFO)
	if (STD_TYPEINFO)
		set(TYPEINFO_IN_STD 1)
		message(STATUS "type_info is available in std namespace")
	else()
		message(FATAL "type_info is not available in std namespace, cannot proceed")
	endif()
endif()

check_cxx_source_compiles("
#include <netdb.h>
int main(int argc, char** argv){
	const char* name = "localhost";
	hostent host;
	char buf[1024];
	hostent* host_ptr;
	int error;
	gethostbyname_r( name, &host, buf, sizeof(buf), &host_ptr, &error ); 
	return 0;
}" GETHOSTBYNAME_R_INPUTS_RESULT)
if (GETHOSTBYNAME_R_INPUTS_RESULT)
	set(GETHOSTBYNAME_R_INPUTS_RESULT 1)
	message(STATUS "The system has gethostbyname_r which takes a result as a pass-in param")
else()
	message(STATUS "The system does not have a gethostbyname_r which takes a result as a pass-in param")
endif()


# Checks for libraries.
#AC_CHECK_LIB(c,shutdown,true,AC_CHECK_LIB(socket,shutdown))
#AC_CHECK_LIB(c,inet_addr,true,AC_CHECK_LIB(nsl,inet_addr))
#AC_CHECK_LIB(c,nanosleep,true,AC_CHECK_LIB(rt,nanosleep))
#AC_CHECK_LIB(compat,ftime)

# Checks for header files.
# check for boost::pool_allocator
#AC_MSG_CHECKING(for boost::pool_allocator)
#AC_TRY_COMPILE(
#	[#include <boost/pool/pool_alloc.hpp>
#	 #include<vector>],
#	[std::vector<int, boost::pool_allocator<int> > x;],
#	AC_MSG_RESULT(yes)
#	AC_DEFINE(HAVE_BOOST_POOL_ALLOCATOR, 1,
#	boost::pool_allocator exists),
#	AC_MSG_RESULT(no))

# check for boost::fast_pool_allocator
#AC_MSG_CHECKING(for boost::fast_pool_allocator)
#AC_TRY_COMPILE(
#	[#include <boost/pool/pool_alloc.hpp>
#	 #include<vector>],
#	[std::vector<int, boost::fast_pool_allocator<int> > x;],
#	AC_MSG_RESULT(yes)
#	AC_DEFINE(HAVE_BOOST_FAST_POOL_ALLOCATOR, 1,
#	boost::fast_pool_allocator exists),
#	AC_MSG_RESULT(no))

# check for __gnu_cxx::__pool_alloc
#AC_MSG_CHECKING(__gnu_cxx::__pool_alloc)
#AC_TRY_COMPILE(
#	[#include <ext/pool_allocator.h>
#	 #include<vector>],
#	[std::vector<int, __gnu_cxx::__pool_alloc<int> > x;],
#	AC_MSG_RESULT(yes)
#	AC_DEFINE(HAVE_POOL_ALLOCATOR, 1,
#	__gnu_cxx::pool_allocator exists),
#	AC_MSG_RESULT(no))

# check for __gnu_cxx::__mt_alloc
#AC_MSG_CHECKING(__gnu_cxx::__mt_alloc)
#AC_TRY_COMPILE(
#	[#include <ext/mt_allocator.h>
#	 #include<vector>],
#	[std::vector<int, __gnu_cxx::__mt_alloc<int> > x;],
#	AC_MSG_RESULT(yes)
#	AC_DEFINE(HAVE_MT_ALLOCATOR, 1,
#	__gnu_cxx::mt_allocator exists),
#	AC_MSG_RESULT(no))

# check for __gnu_cxx::bitmap_allocator
#AC_MSG_CHECKING(__gnu_cxx::bitmap_allocator)
#AC_TRY_COMPILE(
#	[#include <ext/bitmap_allocator.h>
#	 #include<vector>],
#	[std::vector<int, __gnu_cxx::bitmap_allocator<int> > x;],
#	AC_MSG_RESULT(yes)
#	AC_DEFINE(HAVE_BITMAP_ALLOCATOR, 1,
#	__gnu_cxx::bitmap_allocator exists),
#	AC_MSG_RESULT(no))


#AC_CHECK_LIB(iberty, cplus_demangle,    
#  AC_DEFINE(HAVE_CPLUS_DEMANGLE,1,whether or not we have to demangle names)
#  LIBS="$LIBS -liberty")

# Checks for runtime behavior
#AC_MSG_CHECKING(if select modifies timeval parameter)
#AC_TRY_RUN(
#[
#include <unistd.h>
#include <sys/types.h>
#include <sys/time.h>
#int main(int argc, char** argv)
#{
#  struct timeval tv;
#  tv.tv_sec = 0;
#  tv.tv_usec = 1;
#  select(0,0,0,0,&tv);
#  return tv.tv_usec != 1 ? 0 : 1;
#}
#],
#AC_MSG_RESULT(yes)
#AC_DEFINE(SELECT_MODIFIES_TIMEVAL, 1, 
#select statement decrements timeval parameter if interupted),
#AC_MSG_RESULT(no),
#AC_MSG_RESULT(unable to determine, assuming no...))


if (QF_WITH_NEW_ALLOCATOR)
set(ENABLE_NEW_ALLOCATOR 1)
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
