import QtQuick 2.4
import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick.Scene3D 2.0
import Kinect 1.0

Item {
    ListModel {
        id: objectModel

        ListElement{
            mesh: "model/cross-pot.obj"
            material: "model/pot_normal.webp"
            diffuse: "model/pot.webp"
            x: 0
            y: 0
            z: -140
        }
        ListElement{
            mesh: "model/bunny_200.obj"
            material: "model/pot_normal.webp"
            diffuse: "model/pot.webp"
            x: 0.1
            y: -0.1
            z: -0.7
        }
        ListElement{
            mesh: "model/cross-pot.obj"
            material: "model/pot_normal.webp"
            diffuse: "model/pot.webp"
            x: 20
            y: 0
            z: -100
        }
    }

    property int selectedIndex: -1

    Grid {
        anchors.fill: parent
        anchors.margins: 40
        rows: 2
        columns: 3

        Repeater{
            id: objectList
            model: objectModel

            EntityScene{
                width: 180
                height: 230

                mesh: model.mesh
                material: model.material
                diffuse: model.diffuse
                objectX: model.x
                objectY: model.y
                objectZ: model.z

                function select()
                {
                    selectedIndex = index;
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.select();
                }

                TNuiHandArea{
                    anchors.fill: parent
                    onPressDown: parent.select();
                }
            }
        }
    }

    onSelectedIndexChanged: {
        for (var i = 0; i < objectModel.count; i++) {
            var object = objectList.itemAt(i);
            object.visible = false;
            object.width = 180;
            object.height = 230;
        }
        if (0 <= selectedIndex && selectedIndex < objectModel.count) {
            var target = objectList.itemAt(selectedIndex);
            target.visible = true;
            target.width = 360;
            target.height = 460;
        }
    }

    /*property bool inBothHand: false
    property string targetHand: "left"

    TNuiSkeleton{
        id: leftHand
        target: "hand_left"
        onRealPosChanged: {
            if (exampleObject.source == "")
                return;

            if (exampleObject.targetHand === "left") {
                exampleObject.attachToPosition(realPos);
            }

            if (exampleObject.inBothHand) {
                var d = realPos.minus(rightHand.realPos);
                if (d.length() > 0.07) {
                    exampleObject.targetHand = "right";
                    exampleObject.inBothHand = false;
                }
            }
        }
    }

    TNuiSkeleton{
        id: rightHand
        target: "hand_right"
        onRealPosChanged: {
            if (exampleObject.source == "")
                return;

            if (exampleObject.targetHand === "right") {
                exampleObject.attachToPosition(realPos);
            }

            if (exampleObject.inBothHand) {
                var d = realPos.minus(leftHand.realPos);
                if (d.length() > 0.07) {
                    exampleObject.targetHand = "left";
                    exampleObject.inBothHand = false;
                }
            }
        }
    }

    function attachToPosition(realPos){
        if (item) {
            var ratio = 200;
            item.objectX = realPos.x * ratio;
            item.objectY = realPos.y * ratio;
            item.objectZ = -realPos.z * ratio;

            var d = leftHand.realPos.minus(rightHand.realPos);
            if (d.length() <= 0.05)
                inBothHand = true;
        }
    }*/
}
