import QtQuick 2.3
import QtQuick.Window 2.2
import Kinect 1.0

Window {
    visible: true
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 480

    Image{
        id: background
        x: 0
        y: 0
        anchors.fill: parent
        source: "image/default-background.jpg"
    }

    TNuiColorCamera{
        id: cameraView
        x: 0
        y: 0
        anchors.fill: parent


        MouseArea{
            id: rightEdge
            width: 30
            height: parent.height
            x: parent.width - width
            y: 0
            hoverEnabled: true
            onEntered: controlPanel.slideLeft();
        }

        Item{
            id: controlPanel
            width: 84
            height: parent.height
            x: parent.width - width
            y: 0

            MouseArea{
                anchors.fill: controlPanel
                hoverEnabled: true
                onExited: controlPanel.slideRight();

                Item{
                    id: buttonArea
                    width: parent.width - 20
                    height: parent.height
                    x: 20

                    NuiButton{
                        id: snapshotButton
                        x: 0
                        y: 10
                        width: 48
                        height: 48
                        image: "image/icon/camera.png"
                        text: qsTr("Camera")
                    }

                    NuiButton{
                        id: recordButton
                        x: 0
                        y: 64
                        width: 48
                        height: 48
                        image: "image/icon/video.png"
                        text: qsTr("Record")
                    }

                    NuiButton{
                        id: changeBackgroundButton
                        x: 0
                        y: 148
                        width: 48
                        height: 48
                        image: "image/icon/photo.png"
                        text: qsTr("Backgound")
                    }

                    NuiButton{
                        id: introductionButton
                        x: 0
                        y: 212
                        width: 48
                        height: 48
                        image: "image/icon/text.png"
                        text: qsTr("Introduction")
                    }

                    NuiButton{
                        id: messageButton
                        x: 0
                        y: 276
                        width: 48
                        height: 48
                        image: "image/icon/comment.png"
                        text: qsTr("Message")
                    }

                    NuiButton{
                        id: settingButton
                        x: 0
                        y: parent.height - height - 18
                        width: 48
                        height: 48
                        image: "image/icon/setting.png"
                        text: qsTr("Settings")
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
}
