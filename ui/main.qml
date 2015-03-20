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

        SidePanel{
            width: 84
            height: parent.height
            x: parent.width - width
            y: 0
            hidingDirection: Qt.LeftToRight

            buttons: ListModel{
                ListElement{
                    buttonImage: "image/icon/camera.png"
                    buttonLabel: qsTr("Camera")
                }

                ListElement{
                    buttonImage: "image/icon/video.png"
                    buttonLabel: qsTr("Record")
                }

                ListElement{
                    buttonImage: "image/icon/photo.png"
                    buttonLabel: qsTr("Backgound")
                }

                ListElement{
                    buttonImage: "image/icon/text.png"
                    buttonLabel: qsTr("Introduction")
                }

                ListElement{
                    buttonImage: "image/icon/comment.png"
                    buttonLabel: qsTr("Message")
                }
            }
        }

        SidePanel{
            width: 84
            height: parent.height
            x: 0
            y: 0
            hidingDirection: Qt.RightToLeft

            buttons: ListModel{
                ListElement{
                    buttonImage: "image/icon/setting.png"
                    buttonLabel: qsTr("Settings")
                }
            }
        }
    }

    /*TNuiMouse{
        id: mouse
        x: 0
        y: 0
        width: 10
        height: 10
    }*/
}
