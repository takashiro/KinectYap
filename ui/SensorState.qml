import QtQuick 2.0
import Kinect 1.0

Item {
    property alias font: label.font

    Text {
        anchors.fill: parent
        id: label
        color: "#FFFFFF"
        Component.onCompleted: text = NuiSensor.state != "connected" ? qsTr("Loading...") : qsTr("The device is ready.");
    }

    TNuiHandArea {
        anchors.fill: parent
        onEntered: label.visible = true;
        onExited: label.visible = false;
    }

    Timer {
        id: clearLabelTimer
        interval: 3000
        repeat: false
        onTriggered: label.visible = false;
    }

    function makeToast(text)
    {
        label.visible = true;
        label.text = text;
    }

    Connections {
        target: NuiSensor
        onStateChanged: {
            switch (NuiSensor.state) {
            case "connected":
                makeToast(qsTr("Connected."));
                clearLabelTimer.start();
                break;
            case "initializing":
                makeToast(qsTr("Initializing..."));
                break;
            case "not_connected":
                makeToast(qsTr("Not connected."));
                break;
            case "invalid":
                makeToast(qsTr("Invalid."));
                break;
            case "not_supported":
                makeToast(qsTr("Unsupported model."));
                break;
            case "insufficient_bandwidth":
                makeToast(qsTr("Bandwidth is insufficient."));
                break;
            case "unpowered":
                makeToast(qsTr("The device is connected but unpowered."));
                break;
            case "not_ready":
                makeToast(qsTr("There was some unspecified error."));
                break;
            default:
                makeToast(qsTr("Unexpected error."));
            }
        }
    }
}

