import QtQuick 2.4
import QtQuick.Window 2.2
import QtQml.Models 2.1
import Kinect 1.0

Window {
    visible: true
    width: 640
    height: 480
    minimumWidth: 640
    maximumWidth: 640
    minimumHeight: 480
    maximumHeight: 480

    Item {
        id: cameraView
        anchors.fill: parent

        ImageSlider{
            id: background
            x: 0
            y: 0
            anchors.fill: parent
            folder: "image/background/"
            onRollback: camera.backgroundRemoved = false;
        }

        TNuiColorCamera{
            id: camera
            x: 0
            y: 0
            anchors.fill: parent

            Countdown{
                anchors.centerIn: parent

                id: cameraTimer
                maxNumber: 3
                onTriggered: {
                    cameraView.grabToImage(function(result){
                        result.saveToFile("photo.jpg");
                    });
                }
            }

            SidePanel{
                id: rightPanel
                width: 84
                height: parent.height
                x: parent.width - width
                y: 0
                hidingDirection: Qt.LeftToRight

                buttons: ObjectModel{
                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/camera.png"
                        text: qsTr("Camera")
                        onLongTouched: cameraTimer.start();
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/video.png"
                        text: qsTr("Videos")
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/background.png"
                        text: qsTr("Backgound")
                        onLongTouched: {
                            if (camera.backgroundRemoved) {
                                background.gotoNext();
                            } else {
                                camera.backgroundRemoved = true;
                            }
                        }
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/introduction.png"
                        text: qsTr("Introduction")
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/talk.png"
                        text: qsTr("Talk")
                    }
                }
            }

            SidePanel{
                id: leftPanel
                width: 84
                height: parent.height
                x: 0
                y: 0
                hidingDirection: Qt.RightToLeft

                buttons: ObjectModel{
                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/exit.png"
                        text: qsTr("Exit")
                        onLongTouched: Qt.quit();
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/setting.png"
                        text: qsTr("Settings")
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/magic.png"
                        text: qsTr("Debug")
                        onLongTouched: {
                            leftHandLight.visible = !leftHandLight.visible;
                            rightHandLight.visible = !rightHandLight.visible;
                        }
                    }
                }
            }
        }
    }

    TNuiTrackerItem{
        id: rightTracker
        target: "hand_right"
    }
    MagicLight{
        id: rightHandLight
        centerX: rightTracker.x
        centerY: rightTracker.y
        visible: false
    }

    TNuiTrackerItem{
        id: leftTracker
        target: "hand_left"
    }
    MagicLight{
        id: leftHandLight
        centerX: leftTracker.x
        centerY: leftTracker.y
        visible: false
    }
}
