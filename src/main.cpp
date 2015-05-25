#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "tnuisensormanager.h"
#include "tnuisensor.h"
#include "kinectglobal.h"
#include "tnuiinteractionstream.h"

#include "handler/exception_handler.h"

const char *State2String(TNuiSensor::State state)
{
    switch(state){
    case TNuiSensor::ConnectedState:return "connected";
    case TNuiSensor::InitializingState:return "The device is connected, but still initializing.";
    case TNuiSensor::NotConnectedState:return "The device is not connected.";
    case TNuiSensor::NotGenuine:return "The device is not a valid Kinect.";
    case TNuiSensor::NotSupportedState:return "The device is an unsupported model.";
    case TNuiSensor::InsufficientBandwidthState:return "The device is connected to a hub without the necessary bandwidth requirements.";
    case TNuiSensor::NotPoweredState:return "The device is connected, but unpowered.";
    case TNuiSensor::NotReadyState:return "There was some other unspecified error.";
    default:return "Unknown Error";
    }
}

int main(int argc, char *argv[])
{
    google_breakpad::ExceptionHandler eh(L"./dmp", NULL, NULL, NULL, google_breakpad::ExceptionHandler::HANDLER_ALL);

    QGuiApplication app(argc, argv);
    initializeKinect();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("ui/main.qml")));

    TNuiSensor *sensor = SensorManager->sensor();
    if (sensor != nullptr) {
        qDebug(State2String(sensor->state()));
        TNuiSensor::connect(sensor, &TNuiSensor::stateChanged, [&](){
            qDebug(State2String(sensor->state()));
        });

        sensor->initialize(TNuiSensor::UseColorFlag | TNuiSensor::UseDepthAndPlayerIndexFlag | TNuiSensor::UseSkeletonFlag);
    }

    return app.exec();
}
