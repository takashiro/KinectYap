#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <handler/exception_handler.h>

#include "tnuisensormanager.h"
#include "tnuisensor.h"
#include "kinectglobal.h"

int main(int argc, char *argv[])
{
    google_breakpad::ExceptionHandler eh(L"./dmp", NULL, NULL, NULL, google_breakpad::ExceptionHandler::HANDLER_ALL);

    QGuiApplication app(argc, argv);
    initializeKinect();

    QQmlApplicationEngine engine;

    TNuiSensor *sensor = SensorManager->sensor();
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("NuiSensor", sensor);
    engine.load(QUrl(QStringLiteral("ui/main.qml")));
    if (sensor != nullptr)
        sensor->initialize(TNuiSensor::UseColorFlag | TNuiSensor::UseDepthAndPlayerIndexFlag | TNuiSensor::UseSkeletonFlag);

    return app.exec();
}
