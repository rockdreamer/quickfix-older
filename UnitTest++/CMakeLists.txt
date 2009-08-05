include_directories(src)
set(TLIB_NAME UnitTest++)
set(TLIB_SRCS 
	src/AssertException.cpp 
	src/Test.cpp 
	src/Checks.cpp 
	src/TestRunner.cpp 
	src/TestResults.cpp 
	src/TestReporter.cpp 
	src/TestReporterStdout.cpp 
	src/ReportAssert.cpp 
	src/TestList.cpp 
	src/TimeConstraint.cpp 
	src/TestDetails.cpp 
	src/MemoryOutStream.cpp 
	src/DeferredTestReporter.cpp 
	src/DeferredTestResult.cpp 
	src/XmlTestReporter.cpp
)
if (UNIX)
set(TLIB_SRCS ${TLIB_SRCS} src/Posix/SignalTranslator.cpp src/Posix/TimeHelpers.cpp)
else()
set(TLIB_SRCS ${TLIB_SRCS} src/Win32/TimeHelpers.cpp)
endif()
include(QFLibrary)

