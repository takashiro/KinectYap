import QtQuick 2.0
import Kinect 1.0

Rectangle {
    property alias title: titleItem.text
    property alias content: contentItem.text

    color: Qt.rgba(255, 255, 255, 0.6)
    id: background

    TNuiHandArea{
        anchors.fill: parent
        onPressDown: hide();
    }

    Item{
        anchors.fill: parent
        anchors.margins: 20

        Text{
            id: titleItem
            width: parent.width
            wrapMode: Text.WordWrap
            font.pointSize: 24
            text: "Sample Object"
        }

        Item{
            id: titleSpace
            height: 20
            anchors.top: titleItem.bottom
        }

        Text{
            id: contentItem
            width: parent.width
            anchors.top: titleSpace.bottom
            wrapMode: Text.WordWrap
            font.pointSize: 16
            text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        }
    }

    PropertyAnimation{
        id: showAnimation
        target: background
        property: "opacity"
        from: 0
        to: 1
        duration: 500
        onStarted: background.visible = true;
    }

    PropertyAnimation{
        id: hideAnimation
        target: background
        property: "opacity"
        from: 1
        to: 0
        duration: 500
        onStopped: background.visible = false;
    }

    function show(){
        showAnimation.start();
    }

    function hide(){
        hideAnimation.start();
    }
}
