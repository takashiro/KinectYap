import QtQuick 2.3
import QtQuick.Window 2.2
import Kinect 1.0

Window {
    visible: true
    width: 640
    height: 480

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

        Rectangle{
            id: controlPanel
            width: 56
            height: parent.height
            color: "#00000000"
            x: parent.width - width - 10
            y: 0

            Image{
                id: snapshotButton
                x: 0
                y: 10
                width: 48
                height: 48
                source: "image/icon/camera.png"
            }

            Image{
                id: recordButton
                x: 0
                y: 64
                width: 48
                height: 48
                source: "image/icon/video.png"
            }

            Image{
                id: itemButton
                x: 0
                y: 148
                width: 48
                height: 48
                source: "image/icon/photo.png"
            }

            Image{
                id: introductionButton
                x: 0
                y: 212
                width: 48
                height: 48
                source: "image/icon/text.png"
            }

            Image{
                id: commentButton
                x: 0
                y: 276
                width: 48
                height: 48
                source: "image/icon/comment.png"
            }

            Image{
                id: settingButton
                x: 0
                y: parent.height - height - 18
                width: 48
                height: 48
                source: "image/icon/setting.png"
            }
        }
    }
}
