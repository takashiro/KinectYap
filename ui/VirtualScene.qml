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
            position: Qt.vector3d( 0, 0, -300.0 )
            upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
            viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
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
            id: rightHand
            target: "hand_right"

            onRealPosChanged: {
                exampleObject.x = -realPos.x * 200;
                exampleObject.y = realPos.y * 200;
                //exampleObject.z = realPos.z * 200;
            }
        }

        GeneralEntity {
            id: exampleObject
            mesh: "model/cross-pot.obj"
            material: "model/pot_normal.webp"
            diffuse: "model/pot.webp"
        }
    }
}
