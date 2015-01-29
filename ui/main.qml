import QtQuick 2.3
import QtQuick.Window 2.2
import Kinect 1.0

Window {
    visible: true
    width: 640
    height: 480

    TVideo{
        id: videoView
        x: 0
        y: 0
        anchors.fill: parent
    }
}
