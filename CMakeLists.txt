cmake_minimum_required(VERSION 2.6)
project(quickfix C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/)

include(QFoptions)
include(QFlibs NO_POLICY_SCOPE)
include(QFconfig)

set(TLIB_VERSION 12.0.0)

add_subdirectory(UnitTest++)
add_subdirectory(src)
add_subdirectory(bin)
add_subdirectory(spec)
add_subdirectory(test)
if(QF_WITH_EXAMPLES)
	add_subdirectory(examples)	
endif()
add_subdirectory(doc)
