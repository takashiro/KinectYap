
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

SOURCES += \
    src/kinect/tnuisensorselector.cpp \
    src/kinect/tbackgroundremover.cpp \
    src/kinect/windowsutil.cpp

HEADERS += \
    src/kinect/tnuisensorselector.h \
    src/kinect/tbackgroundremover.h \
    src/kinect/windowsutil.h \
    src/kinect/stdafx.h
