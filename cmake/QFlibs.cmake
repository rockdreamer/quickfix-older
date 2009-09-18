#using old cmake policy where we link by path + libname
cmake_policy(SET CMP0003 OLD)

#message(STATUS "prefix path:"  ${CMAKE_PREFIX_PATH})

find_package(LibXml2 REQUIRED)
get_filename_component(LIBXML2LIBNAME ${LIBXML2_LIBRARIES} NAME)
get_filename_component(LIBXML2LIBDIR ${LIBXML2_LIBRARIES} PATH)
set(COMMONLIBS ${COMMON} ${LIBXML2LIBNAME} )
include_directories(${LIBXML2_INCLUDE_DIR} )
link_directories(${LIBXML2LIBDIR} )

find_package(Threads REQUIRED)
set(COMMONLIBS ${COMMONLIBS} ${CMAKE_THREAD_LIBS_INIT} )

if(QF_WITH_BOOST)
set(Boost_DEBUG ON)
set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_MULTITHREAD ON)
find_package(Boost 1.38.0 COMPONENTS thread system)
link_directories(${Boost_LIBRARY_DIRS})
include_directories(${Boost_INCLUDE_DIR})
set(COMMONLIBS ${Boost_LIBRARIES} ${COMMONLIBS} )
if (WIN32)
	install(FILES ${Boost_LIBRARY_DIRS}/boost_thread-vc80-mt-1_38.dll DESTINATION bin)
endif(WIN32)
endif()

if (QF_WITH_MYSQL)
#TODO
endif()

if (QF_WITH_POSTGRESQL)
#TODO
endif()

if (QF_WITH_PYTHON)
#TODO
endif()
