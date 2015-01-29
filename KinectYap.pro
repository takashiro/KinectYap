#-------------------------------------------------
#
# Project created by QtCreator 2015-01-28T21:47:15
#
#-------------------------------------------------

QT       += core gui widgets

TARGET = KinectYap
TEMPLATE = app

INCLUDEPATH += "$$(KINECTSDK10_DIR)inc"
INCLUDEPATH += "$$(KINECT_TOOLKIT_DIR)inc"

contains(QMAKE_HOST.arch, x86_64){
    LIBS += -L"$$(KINECTSDK10_DIR)lib/amd64"
    LIBS += -L"$$(KINECT_TOOLKIT_DIR)Lib/amd64"

    LIBS += -lKinectBackgroundRemoval180_64
}else{
    LIBS += -L"$$(KINECTSDK10_DIR)lib/x86"
    LIBS += -L"$$(KINECT_TOOLKIT_DIR)Lib/x86"

    LIBS += -lKinectBackgroundRemoval180_32
}
LIBS += -lKinect10

INCLUDEPATH += src/kinect

SOURCES += src/main.cpp \
    src/kinect/tnuisensorselector.cpp \
    src/kinect/windowsutil.cpp \
    src/view/mainwindow.cpp


HEADERS += src/kinect/tnuisensorselector.h \
    src/kinect/windowsutil.h \
    src/view/mainwindow.h

FORMS += src/view/mainwindow.ui
