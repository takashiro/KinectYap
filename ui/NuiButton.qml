import QtQuick 2.4
import QtGraphicalEffects 1.0
import Kinect 1.0

Item{
    property alias image: buttonImage.source
    property alias text: label.text

    signal longTouched()
    signal pressDown()
    signal pressUp()

    Image{
        id: buttonImage
        anchors.fill: parent
    }

    Text{
        id: label
        x: 0
        y: (parent.height - height) * 0.5
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
        onClicked: parent.longTouched();
    }

    TNuiHandArea{
        anchors.fill: parent

        onEntered: setLabelVisble(true);
        onExited: {
            parent.scale = 1.0;
            setLabelVisble(false);
        }

        onHandZChanged: parent.scale = initialHandZ / handZ;

        onLongTouched: parent.longTouched();
        onPressDown: parent.pressDown();
        onPressUp: parent.pressUp();
    }

    function setLabelVisble(visible){
        var pos = mapToItem(null, x, y);
        if (pos.x - label.width - 12 <= 0) {
            label.x = width + 12;
        } else {
            label.x = -label.width - 12;
        }

        label.visible = visible;
        labelShadow.visible = visible;
    }
}
