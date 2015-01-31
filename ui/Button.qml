import QtQuick 2.3
import QtGraphicalEffects 1.0

Item{
    property alias image: buttonImage.source

    Image{
        id: buttonImage
        x: 0
        y: 0
        anchors.fill: parent
    }

    DropShadow {
        anchors.fill: buttonImage
        source: buttonImage
        horizontalOffset: 2
        verticalOffset: 2
        radius: 8.0
        samples: 16
        color: "#80000000"
    }
}
