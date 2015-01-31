#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "tnuisensormanager.h"
#include "tnuisensor.h"

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
    QGuiApplication app(argc, argv);

    TNuiSensor *sensor = SensorManager->sensor();
    if (sensor != nullptr) {
        qDebug(State2String(sensor->state()));
        TNuiSensor::connect(sensor, &TNuiSensor::stateChanged, [&](){
            qDebug(State2String(sensor->state()));
        });
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("ui/main.qml")));

    return app.exec();
}
