set(TLIB_NAME quickfix)
set(TLIB_SRCS 
	Session.cpp 
	Session.h 
	TimeRange.cpp 
	TimeRange.h 
	SessionState.h 
	SessionFactory.h 
	SessionFactory.cpp 
	Parser.cpp 
	Parser.h 
	Log.cpp 
	Log.h 
	FileLog.cpp 
	FileLog.h 
	Settings.cpp 
	Settings.h 
	MessageStore.cpp 
	MessageStore.h 
	SocketServer.cpp 
	SocketServer.h 
	SocketConnector.cpp 
	Acceptor.cpp 
	Acceptor.h 
	Initiator.cpp 
	Initiator.h 
	SocketAcceptor.cpp 
	SocketAcceptor.h 
	SocketInitiator.cpp 
	SocketInitiator.h 
	SocketMonitor.cpp 
	SocketMonitor.h 
	SocketConnection.cpp 
	SocketConnection.h 
	ThreadedSocketAcceptor.cpp 
	ThreadedSocketAcceptor.h 
	ThreadedSocketInitiator.cpp 
	ThreadedSocketInitiator.h 
	ThreadedSocketConnection.cpp 
	ThreadedSocketConnection.h 
	NullStore.cpp 
	NullStore.h 
	FileStore.cpp 
	FileStore.h 
	MySQLConnection.h 
	MySQLStore.cpp 
	MySQLStore.h 
	MySQLLog.cpp 
	MySQLLog.h 
	PostgreSQLConnection.h 
	PostgreSQLStore.cpp 
	PostgreSQLStore.h 
	PostgreSQLLog.cpp 
	PostgreSQLLog.h 
	DatabaseConnectionID.h 
	DatabaseConnectionPool.h 
	Dictionary.cpp 
	Dictionary.h 
	DataDictionary.cpp 
	DataDictionary.h 
	SessionSettings.cpp 
	SessionSettings.h 
	Application.h 
	Field.h 
	FieldConvertors.h 
	FieldNumbers.h 
	DeprecatedFieldNumbers.h 
	FieldTypes.cpp 
	FieldTypes.h 
	Fields.h 
	DeprecatedFields.h 
	FieldMap.cpp 
	FieldMap.h 
	Message.cpp 
	Message.h 
	Group.cpp 
	Group.h 
	MessageSorters.cpp 
	MessageSorters.h 
	HtmlBuilder.h 
	HttpParser.cpp 
	HttpParser.h 
	HttpMessage.cpp 
	HttpMessage.h 
	HttpConnection.h 
	HttpConnection.cpp 
	HttpServer.cpp 
	HttpServer.h 
	SessionID.h 
	SocketConnector.h 
	Mutex.h 
	Event.h 
	Queue.h 
	Exceptions.h 
	Utility.cpp 
	Utility.h 
	Values.h 
	DeprecatedValues.h 
	FlexLexer.h 
	DOMDocument.h 
	LIBXML_DOMDocument.cpp 
	LIBXML_DOMDocument.h 
	MessageCracker.h 
	Responder.h 
	CallStack.h 
	CallStack.cpp
)
if (WIN32)
set(TLIB_SRCS ${TLIB_SRCS} 
	stdafx.h
	MSXML_DOMDocument.h
	MSXML_DOMDocument.cpp
)
endif()
include(QFLibrary)
install(DIRECTORY . DESTINATION include/quickfix
          FILES_MATCHING PATTERN "*.h")
install(DIRECTORY fix40 DESTINATION include/quickfix
          FILES_MATCHING PATTERN "*.h")
install(DIRECTORY fix41 DESTINATION include/quickfix
          FILES_MATCHING PATTERN "*.h")
install(DIRECTORY fix42 DESTINATION include/quickfix
          FILES_MATCHING PATTERN "*.h")
install(DIRECTORY fix43 DESTINATION include/quickfix
          FILES_MATCHING PATTERN "*.h")
install(DIRECTORY fix44 DESTINATION include/quickfix
          FILES_MATCHING PATTERN "*.h")
add_subdirectory(test)
