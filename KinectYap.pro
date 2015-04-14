#-------------------------------------------------
#
# Project created by QtCreator 2015-01-28T21:47:15
#
#-------------------------------------------------

QT       += qml quick

TARGET = KinectYap
TEMPLATE = app

WORKING_DIR = $$system_path($$PWD)

KINECT_LIB = KinectBackgroundRemoval KinectInteraction
include(src/kinect/kinect.pri)

include(src/breakpad/breakpad.pri)

SOURCES += \
    src/main.cpp

win32{
    RC_FILE += kinect.rc
}

OTHER_FILES += src/kinect/kinect.pri \
    src/breakpad/breakpad.pri

DISTFILES += \
    ui/main.qml \
    ui/SidePanel.qml \
    ui/MagicLight.qml \
    ui/NuiButton.qml \
    ui/Countdown.qml
