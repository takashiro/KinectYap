import QtQuick 2.3
import QtQuick.Window 2.2
import Kinect 1.0

Window {
    visible: true
    width: 640
    height: 480
    flags: Qt.FramelessWindowHint

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

        Item{
            id: controlPanel
            width: 56
            height: parent.height
            x: parent.width - width - 10
            y: 0

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
                id: itemButton
                x: 0
                y: 148
                width: 48
                height: 48
                image: "image/icon/photo.png"
                text: qsTr("Items")
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
                id: commentButton
                x: 0
                y: 276
                width: 48
                height: 48
                image: "image/icon/comment.png"
                text: qsTr("Comment")
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
}
