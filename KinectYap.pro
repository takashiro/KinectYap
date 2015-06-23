#-------------------------------------------------
#
# Project created by QtCreator 2015-01-28T21:47:15
#
#-------------------------------------------------

QT       += qml quick 3dcore 3dquick 3dquickrenderer

TARGET = KinectYap
TEMPLATE = app

WORKING_DIR = $$system_path($$PWD)

KINECT_LIB = KinectBackgroundRemoval
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
    ui/Countdown.qml \
    ui/ImageSlider.qml \
    ui/SensorState.qml \
    ui/VirtualScene.qml
