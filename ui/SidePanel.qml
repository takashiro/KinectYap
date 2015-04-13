import QtQuick 2.4
import Kinect 1.0

Item{
    id: sidePanel
    property alias buttons: buttonList.model
    property var hidingDirection

    TNuiMouseArea{
        width: parent.width * 0.6
        height: parent.height
        x: hidingDirection === Qt.LeftToRight ? parent.width - width : 0
        y: 0
        onEntered: controlPanel.slidingShow();
    }

    MouseArea{
        width: parent.width * 0.6
        height: parent.height
        x: hidingDirection === Qt.LeftToRight ? parent.width - width : 0
        y: 0
        hoverEnabled: true
        onEntered: controlPanel.slidingShow();
    }

    Item{
        id: controlPanel
        width: parent.width
        height: parent.height
        x: parent.width - width
        y: 0

        TNuiMouseArea{
            anchors.fill: parent
            onExited: controlPanel.slidingHide();
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onExited: controlPanel.slidingHide();

            ListView{
                id: buttonList
                width: parent.width * 0.75
                x: parent.width - width
                y: 50
                height: parent.height - y
                spacing: 10
            }
        }

        ParallelAnimation{
            id: hidingAnimation

            PropertyAnimation {
                target: controlPanel
                property: "opacity"
                to: 0
            }

            PropertyAnimation {
                target: controlPanel
                property: "x"
                to: controlPanel.x + (sidePanel.hidingDirection === Qt.LeftToRight ? 15 : -15)
            }

            onStopped: controlPanel.visible = false;
        }

        ParallelAnimation{
            id: appearingAnimation

            PropertyAnimation {
                target: controlPanel
                property: "opacity"
                to: 1
            }

            PropertyAnimation {
                target: controlPanel
                property: "x"
                to: controlPanel.x + (sidePanel.hidingDirection === Qt.LeftToRight ? -15 : 15)
            }

            onStarted: controlPanel.visible = true;
        }

        function slidingHide(){
            if (opacity == 1)
                    hidingAnimation.start();
        }

        function slidingShow(){
            if (opacity == 0)
                    appearingAnimation.start();
        }
    }
}
