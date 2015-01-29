import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480

    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "image/default-background.jpg"
    }
}
