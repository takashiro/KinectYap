#-------------------------------------------------
#
# Project created by QtCreator 2015-01-28T21:47:15
#
#-------------------------------------------------

QT       += qml quick

TARGET = KinectYap
TEMPLATE = app

include(src/kinect/kinect.pri)

SOURCES += \
    src/main.cpp

win32{
    RC_FILE += kinect.rc
}

OTHER_FILES += src/kinect/kinect.pri \
    ui/main.qml
