import QtQuick 2.4
import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick.Scene3D 2.0
import Kinect 1.0

Item {
    property alias mesh: exampleObject.mesh
    property alias material: exampleObject.material
    property alias diffuse: exampleObject.diffuse
    property alias objectX: exampleObject.x
    property alias objectY: exampleObject.y
    property alias objectZ: exampleObject.z

    Scene3D {
        anchors.fill: parent

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

            GeneralEntity {
                id: exampleObject
            }
        }
    }
}
