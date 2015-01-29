#-------------------------------------------------
#
# Project created by QtCreator 2015-01-28T21:47:15
#
#-------------------------------------------------

QT       += qml quick

TARGET = KinectYap
TEMPLATE = app

include(kinect.pri)

SOURCES += \
    src/main.cpp

win32{
    RC_FILE += kinect.rc
}

OTHER_FILES += kinect.pri \
    ui/main.qml
