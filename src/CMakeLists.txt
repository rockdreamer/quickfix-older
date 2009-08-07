include_directories(
	${CMAKE_CURRENT_BINARY_DIR}
	C++
	C++/test
	../UnitTest++/src
)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/config-base.h ${CMAKE_CURRENT_BINARY_DIR}/config.h)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/config.h DESTINATION include/quickfix)

add_subdirectory(C++)
if(HAVE_JAVA)
add_subdirectory(java)
endif()

if(HAVE_PYTHON)
add_subdirectory(python)
endif()

if(HAVE_RUBY)
add_subdirectory(ruby)
endif()

set(NAME_STD at)
set(MAINSRCS at.cpp at_application.h)
set(EXECLIBS quickfix)
include(QFExecutable)

set(NAME_STD ut)
set(MAINSRCS ut.cpp)
set(EXECLIBS quickfix quickfixcpptest UnitTest++)
include(QFExecutable)

set(NAME_STD pt)
set(MAINSRCS pt.cpp)
set(EXECLIBS quickfix)
include(QFExecutable)

