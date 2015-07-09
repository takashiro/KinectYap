import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property int maxNumber
    property int currentNumber
    property alias font: label.font
    property alias textColor: label.color

    signal triggered

    Rectangle{
        id: flashLight
        anchors.fill: parent
        opacity: 0
    }

    SequentialAnimation{
        id: flashLightAnimation
        PropertyAnimation{
            target: flashLight
            property: "opacity"
            from: 0
            to: 0.5
            duration: 200
        }
        PropertyAnimation{
            target: flashLight
            property: "opacity"
            from: 0.5
            to: 0
            duration: 200
        }
    }

    Text{
        id: label
        color: "white"
        font.pointSize: 60
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
        visible: label.visible
    }

    Timer{
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            if (currentNumber == 0) {
                label.text = "";
                flashLightAnimation.start();
                stop();
                parent.triggered();
            } else {
                label.text = currentNumber;
                flashLightAnimation.start();
                currentNumber--;
            }
        }
    }

    function start(){
        currentNumber = maxNumber;
        timer.start();
    }
}
