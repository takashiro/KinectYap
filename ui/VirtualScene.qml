import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick.Scene3D 2.0
import Kinect 1.0

Scene3D {
    Entity {
        id: sceneRoot

        Camera {
            id: camera
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 45
            aspectRatio: 4 / 3
            nearPlane : 0.1
            farPlane : 1000.0
            position: Qt.vector3d(0, 0, 0)
            upVector: Qt.vector3d(0.0, 1.0, 0.0)
            viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
        }

        components: [
            FrameGraph {
                activeFrameGraph: Viewport {
                    id: viewport
                    rect: Qt.rect(0.0, 0.0, 1.0, 1.0) // From Top Left
                    clearColor: Qt.rgba(0, 0, 0, 0)

                    CameraSelector {
                        id : cameraSelector
                        camera: camera

                        ClearBuffer {
                            buffers : ClearBuffer.ColorDepthBuffer
                        }
                    }
                }
            }
        ]

        TNuiSkeleton{
            id: leftHand
            target: "hand_left"
            onRealPosChanged: {
                if (exampleObject.targetHand == "left") {
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
                if (exampleObject.targetHand == "right") {
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

        GeneralEntity {
            id: exampleObject
            mesh: "model/cross-pot.obj"
            material: "model/pot_normal.webp"
            diffuse: "model/pot.webp"

            property string targetHand: "left"
            property bool inBothHand: false

            function attachToPosition(realPos){
                var kinectFarPlane = 5;
                var ratio = camera.farPlane / kinectFarPlane;
                x = realPos.x * ratio;
                y = realPos.y * ratio;
                z = -realPos.z * ratio;

                var d = leftHand.realPos.minus(rightHand.realPos);
                if (d.length() <= 0.05)
                    inBothHand = true;
            }
        }
    }
}
