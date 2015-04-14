import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property int maxNumber
    property int currentNumber
    property alias font: label.font
    property alias textColor: label.color

    signal triggered

    Text{
        id: label
        color: "white"
        font.pointSize: 40
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

    Timer{
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            if (currentNumber == 0) {
                label.text = "";
                stop();
                parent.triggered();
            } else {
                label.text = currentNumber;
                currentNumber--;
            }
        }
    }

    function start(){
        currentNumber = maxNumber;
        timer.start();
    }
}
