import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480

    Image {
        id: image1
        anchors.fill: parent
        source: "image/default-background.jpg"
    }

    Text {
        text: qsTr("Hello World")
        anchors.verticalCenterOffset: -173
        anchors.horizontalCenterOffset: -153
        anchors.centerIn: parent
    }
}
