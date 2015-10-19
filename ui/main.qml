import QtQuick 2.4
import QtQuick.Window 2.2
import QtQml.Models 2.1
import Kinect 1.0

Window {
    visible: true
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 480
    maximumWidth: 640
    maximumHeight: 480
    color: "black"

    Item {
        id: cameraView
        anchors.fill: parent

        ImageSlider{
            id: background
            x: 0
            y: 0
            anchors.fill: parent
            folder: "image/background/"
            onRollback: {
                visible = false;
                camera.backgroundRemoved = false;
            }
            visible: false
        }

        TNuiColorCamera{
            id: camera
            x: 0
            y: 0
            anchors.fill: parent
            antialiasing: true

            Loader{
                id: virtualScene
                anchors.fill: parent
            }

            Loader{
                id: dialog
                anchors.fill: parent
                anchors.margins: 40
            }

            SensorState{
                width: 100
                height: 24
                x: 10
                y: parent.height - height - 10
                font.pixelSize: 18
            }

            Image{
                id: photo
                opacity: 0
            }

            SequentialAnimation{
                id: showPhotoAnimation

                PauseAnimation{
                    duration: 1000
                }

                ParallelAnimation{
                    PropertyAnimation{
                        target: photo
                        property: "rotation"
                        from: 0
                        to: 20
                    }
                    PropertyAnimation{
                        target: photo
                        property: "scale"
                        from: 1.0
                        to: 0.7
                    }
                }

                PauseAnimation{
                    duration: 1000
                }

                PropertyAnimation{
                    target: photo
                    property: "opacity"
                    from: 1
                    to: 0
                }

                onStarted: photo.opacity = 1;
                onStopped: photo.source = "";
            }

            Countdown{
                anchors.fill: parent

                id: cameraTimer
                maxNumber: 3
                onTriggered: {
                    cameraView.grabToImage(function(result){
                        var today = new Date();
                        var date = today.getFullYear() + '-' + today.getMonth() + '-' + today.getDate();
                        date += ' ' + today.getHours();
                        date += today.getMinutes();
                        date += today.getSeconds();
                        var fileName = "photo_" + date + ".jpg";
                        result.saveToFile(fileName);
                        photo.source = "../" + fileName;
                        showPhotoAnimation.start();
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
                        onClicked: pressDown();
                        onPressDown: cameraTimer.start();
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/roll.png"
                        text: qsTr("Item")
                        onClicked: pressDown();
                        onPressDown: virtualScene.setSource("VirtualScene.qml");
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/background.png"
                        text: qsTr("Backgound")
                        onClicked: pressDown();
                        onPressDown: {
                            if (camera.backgroundRemoved) {
                                background.gotoNext();
                            } else {
                                camera.backgroundRemoved = true;
                                background.visible = true;
                            }
                        }
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/introduction.png"
                        text: qsTr("Introduction")
                        onClicked: pressDown();
                        onPressDown: dialog.setSource("Introduction.qml");
                    }
                }
            }

            SidePanel{
                id: leftPanel
                width: 84
                height: parent.height
                x: 0
                y: 50
                hidingDirection: Qt.RightToLeft

                buttons: ObjectModel{
                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/exit.png"
                        text: qsTr("Exit")
                        onClicked: pressDown();
                        onPressDown: Qt.quit();
                    }

                    NuiButton{
                        width: 48
                        height: 48
                        image: "image/icon/magic.png"
                        text: qsTr("Debug")

                        onLongTouched: pressDown();
                        onClicked: toggleHandLight();
                    }
                }
            }

            Connections{
                target: NuiSensor
                onConnected: {
                    leftPanel.slidingHide();
                    rightPanel.slidingHide();
                }
            }
        }
    }

    function toggleHandLight()
    {
        leftHandLight.visible = !leftHandLight.visible;
        rightHandLight.visible = !rightHandLight.visible;
    }

    TNuiSkeleton{
        id: rightHand
        target: "hand_right"
    }
    MagicLight{
        id: rightHandLight
        centerX: rightHand.x
        centerY: rightHand.y
        visible: false
    }

    TNuiSkeleton{
        id: leftHand
        target: "hand_left"
    }
    MagicLight{
        id: leftHandLight
        centerX: leftHand.x
        centerY: leftHand.y
        visible: false
    }
}
