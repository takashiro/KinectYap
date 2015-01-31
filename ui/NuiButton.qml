import QtQuick 2.3
import QtGraphicalEffects 1.0

Item{
    property alias image: buttonImage.source
    property alias text: label.text

    signal touched()

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

    Text{
        id: label
        x: -width - 12
        y: (parent.height - height) / 2
        color: "white"
        font.pixelSize: 18
        visible: false
    }

    DropShadow {
        id: labelShadow
        anchors.fill: label
        source: label
        horizontalOffset: 2
        verticalOffset: 2
        radius: 8.0
        samples: 16
        color: "#80000000"
        visible: false
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: setLabelVisble(true);
        onExited: setLabelVisble(false);
    }

    function setLabelVisble(visible){
        label.visible = visible;
        labelShadow.visible = visible;
    }
}
