import QtQuick 2.0
import Kinect 1.0

Item{
    property alias buttons: buttonList.model

    TNuiMouseArea{
        width: parent.width * 0.6
        height: parent.height
        x: parent.width - width
        y: 0
        onEntered: controlPanel.slideLeft();
    }

    MouseArea{
        width: parent.width * 0.6
        height: parent.height
        x: parent.width - width
        y: 0
        hoverEnabled: true
        onEntered: controlPanel.slideLeft();
    }

    Item{
        id: controlPanel
        width: parent.width
        height: parent.height
        x: parent.width - width
        y: 0

        TNuiMouseArea{
            anchors.fill: parent
            onExited: controlPanel.slideRight();
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onExited: controlPanel.slideRight();

            ListView{
                id: buttonList
                width: parent.width * 0.75
                x: parent.width - width
                y: 10
                height: parent.height - y
                spacing: 10
                delegate: Component{
                    NuiButton{
                        width: 48
                        height: 48
                        image: buttonImage
                        text: buttonLabel
                    }
                }
            }
        }

        ParallelAnimation{
            id: slideRightAnimation

            PropertyAnimation {
                target: controlPanel
                property: "opacity"
                to: 0
            }

            PropertyAnimation {
                target: controlPanel
                property: "x"
                to: controlPanel.x + 15
            }

            onStopped: controlPanel.visible = false;
        }

        ParallelAnimation{
            id: slideLeftAnimation

            PropertyAnimation {
                target: controlPanel
                property: "opacity"
                to: 1
            }

            PropertyAnimation {
                target: controlPanel
                property: "x"
                to: controlPanel.x - 15
            }

            onStarted: controlPanel.visible = true;
        }

        function slideRight(){
            if (opacity == 1)
                slideRightAnimation.start();
        }

        function slideLeft(){
            if (opacity == 0)
                slideLeftAnimation.start();
        }
    }
}
