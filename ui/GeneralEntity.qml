import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick.Scene3D 2.0
import Kinect3D 1.0

Entity {
    id: sphereEntity

    property alias mesh: meshObject.source
    property alias material: materialObject.normal
    property alias diffuse: materialObject.diffuse
    property alias x: translate.dx
    property alias y: translate.dy
    property alias z: translate.dz
    property alias center: meshObject.center
    property alias xRotate: xRotateTransform.angle
    property alias yRotate: yRotateTransform.angle
    property alias xExtent: meshObject.xExtent
    property alias yExtent: meshObject.yExtent
    property alias zExtent: meshObject.zExtent

    NormalDiffuseMapMaterial {
        id: materialObject
        specular: Qt.rgba( 0.75, 0.75, 0.75, 1.0 )
        shininess: 10.0
    }

    Mesh {
        id: meshObject
    }

    Transform {
        id: translateObject

        Translate {
            dx: -center.x
            dy: -center.y
            dz: -center.z
        }

        Rotate {
            id: xRotateTransform
            axis: Qt.vector3d(1, 0, 0)
        }

        Rotate {
            id: yRotateTransform
            axis: Qt.vector3d(0, 1, 0)
        }

        Translate {
            dx: center.x
            dy: center.y
            dz: center.z
        }

        Translate {
            id: translate
        }
    }

    components: [
        meshObject,
        materialObject,
        translateObject
    ]
}
