include_directories(
	C++
	C++/test)
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
set(EXECLIBS quickfix)
include(QFExecutable)

set(NAME_STD pt)
set(MAINSRCS pt.cpp)
set(EXECLIBS quickfix)
include(QFExecutable)

