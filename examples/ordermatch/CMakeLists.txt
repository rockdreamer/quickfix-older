include_directories(
	${CMAKE_INSTALL_PREFIX}/include/
	${CMAKE_INSTALL_PREFIX}/include/quickfix
)
set(NAME_STD ordermatch)
set(MAINSRCS
	ordermatch.cpp 
	Application.h 
	Application.cpp 
	IDGenerator.h 
	Market.h 
	Market.cpp 
	Order.h 
	OrderMatcher.h
)
set(EXECLIBS quickfix)
include(QFExecutable)

