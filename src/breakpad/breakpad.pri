win32-msvc*{
    QMAKE_LFLAGS_RELEASE = $$QMAKE_LFLAGS_RELEASE_WITH_DEBUGINFO

    SOURCES += $$PWD/client/windows/crash_generation/client_info.cc \
        $$PWD/client/windows/crash_generation/crash_generation_client.cc \
        $$PWD/client/windows/crash_generation/crash_generation_server.cc \
        $$PWD/client/windows/crash_generation/minidump_generator.cc \
        $$PWD/client/windows/handler/exception_handler.cc \
        $$PWD/common/windows/guid_string.cc

    HEADERS += $$PWD/client/windows/crash_generation/client_info.h \
        $$PWD/client/windows/crash_generation/crash_generation_client.h \
        $$PWD/client/windows/crash_generation/crash_generation_server.h \
        $$PWD/client/windows/crash_generation/minidump_generator.h \
        $$PWD/client/windows/handler/exception_handler.h \
        $$PWD/common/windows/guid_string.h

    INCLUDEPATH += $$PWD
    INCLUDEPATH += $$PWD/client/windows
}
