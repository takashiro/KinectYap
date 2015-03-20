import QtQuick 2.3
import QtGraphicalEffects 1.0
import Kinect 1.0

Item{
    property alias image: buttonImage.source
    property alias text: label.text

    signal touched()

    Image{
        id: buttonImage
        anchors.fill: parent
    }

    Text{
        id: label
        x: -width - 12
        y: (parent.height - height) / 2
        color: "white"
        font.pixelSize: parent.height * 0.375
        visible: false
    }

    DropShadow{
        anchors.fill: buttonImage
        source: buttonImage
        radius: 1
        samples: 24
        spread: 1
        color: "#000000"
        horizontalOffset: 1
        verticalOffset: 1
    }

    DropShadow{
        id: labelShadow
        anchors.fill: label
        source: label
        radius: 1
        samples: 24
        spread: 1
        color: "#000000"
        horizontalOffset: 1
        verticalOffset: 1
        visible: false
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: setLabelVisble(true);
        onExited: setLabelVisble(false);
        onClicked: touched();
    }

    TNuiMouseArea{
        anchors.fill: parent
        onEntered: setLabelVisble(true);
        onExited: setLabelVisble(false);
        onTouched: parent.touched();
    }

    function setLabelVisble(visible){
        label.visible = visible;
        labelShadow.visible = visible;
    }
}
