#-------------------------------------------------
#
# Project created by QtCreator 2015-01-28T21:47:15
#
#-------------------------------------------------

QT       += core gui widgets

TARGET = KinectYap
TEMPLATE = app

include(kinect.pri)

INCLUDEPATH += src/view

SOURCES += src/main.cpp \
    src/view/mainwindow.cpp

HEADERS += src/view/mainwindow.h

FORMS += src/view/mainwindow.ui

win32{
    RC_FILE += kinect.rc
}

OTHER_FILES += kinect.pri
