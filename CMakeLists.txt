cmake_minimum_required(VERSION 2.6)
project(quickfix C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/)
set(TLIB_VERSION 12.0.0)

include(QFoptions)
include(QFlibs NO_POLICY_SCOPE)
include(QFconfig)


#add_subdirectory(UnitTest++)
add_subdirectory(src)
#add_subdirectory(bin)
#add_subdirectory(spec)
#add_subdirectory(test)
if(QF_WITH_EXAMPLES)
	add_subdirectory(examples)	
endif()
#add_subdirectory(doc)
	


# Checks for libraries.
#AC_CHECK_LIB(c,shutdown,true,AC_CHECK_LIB(socket,shutdown))
#AC_CHECK_LIB(c,inet_addr,true,AC_CHECK_LIB(nsl,inet_addr))
#AC_CHECK_LIB(c,nanosleep,true,AC_CHECK_LIB(rt,nanosleep))
#AC_CHECK_LIB(compat,ftime)

# Checks for header files.
#AC_CHECK_HEADERS(stdio.h)

#AC_MSG_CHECKING(for STREAMS ioctl)
#AC_TRY_COMPILE(
#	[#include <sys/types.h>
#	 #include <stropts.h>
#	 #include <sys/conf.h>],
#	[ioctl(1,I_NREAD);],
#	AC_MSG_RESULT(yes)
#	AC_DEFINE(USING_STREAMS, 1,
#	The system supports AT&T STREAMS, presumably standard),
#	AC_MSG_RESULT(no))

#AC_MSG_CHECKING(for socklen_t)
#AC_TRY_COMPILE(
#	[#include <unistd.h>
#         #include <sys/types.h>
#         #include <sys/socket.h>],
#	[socklen_t t = 1;],
#	AC_MSG_RESULT(yes),
#	AC_MSG_RESULT(no)
#	AC_DEFINE(socklen_t, int,
#	socklen_t needs to be defined if the system doesn't define it))

#AC_MSG_CHECKING(for ftime)
#AC_TRY_COMPILE(
#	[#include <sys/timeb.h>],
#	[timeb tb;
#         ftime(&tb)],
#	has_ftime=true, has_ftime=false)

#if test $has_ftime = true
#then AC_MSG_RESULT(yes)
#     AC_DEFINE(HAVE_FTIME, 1, found ftime)
#else AC_MSG_RESULT(no)
#fi
#AM_CONDITIONAL(HAVE_FTIME, $has_ftime)

#AC_MSG_CHECKING(for set_terminate in the global namespace)
#AC_TRY_COMPILE(
#	[#include <exception>
#	 void term() {}],
#	[set_terminate(term);],
#        set_terminate_is_global=true, set_terminate_is_global=false)

#if test $set_terminate_is_global = true
#then AC_MSG_RESULT(yes)
#else AC_MSG_RESULT(no)
#    AC_MSG_CHECKING(for set_terminate in the std namespace)
#    AC_TRY_COMPILE(
#    [#include <exception>
#     void term() {}],
#    [std::set_terminate(term);],
#    AC_MSG_RESULT(yes)
#    AC_DEFINE(TERMINATE_IN_STD, 1, 
#    For location of set_terminate),
#    AC_MSG_RESULT(no)
#    AC_MSG_ERROR(unable to find set_terminate in std or global namespace))
#fi

#AC_MSG_CHECKING(for typeinfo in the global namespace)
#AC_TRY_COMPILE(
#	[#include <typeinfo>],
#	[const typeinfo& ty = typeid(typeinfo);],
#	typeinfo_is_global=true, typeinfo_is_global=false)

#if test $typeinfo_is_global = true
#then AC_MSG_RESULT(yes)
#else AC_MSG_RESULT(no)
#    AC_MSG_CHECKING(for typeinfo in the std namespace)
#    AC_TRY_COMPILE(
#    [#include <typeinfo>],
#    [const std::type_info& ty = typeid(std::type_info);],
#    AC_MSG_RESULT(yes)
#    AC_DEFINE(TYPEINFO_IN_STD, 1, 
#    Whether or not we are using the new-style typeinfo header),
#    AC_MSG_RESULT(no)
#    AC_MSG_ERROR(type_info is required by the test library))
#fi

# check for gethostbyname_r
#AC_MSG_CHECKING(for gethostbyname_r with input result)
#AC_TRY_COMPILE(
#	[#include <netdb.h>],
#	[const char* name = "localhost";
#        hostent host;
#         char buf[1024];
#         hostent* host_ptr;
#         int error;
#         gethostbyname_r( name, &host, buf, sizeof(buf), &host_ptr, &error );
#	 return 0;],
#	 AC_MSG_RESULT(yes)
#	 AC_DEFINE(GETHOSTBYNAME_R_INPUTS_RESULT, 1,
#	 The system has gethostbyname_r which takes a result as a pass-in param),
#	 AC_MSG_RESULT(no))

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
