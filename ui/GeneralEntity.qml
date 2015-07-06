import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick.Scene3D 2.0

Entity {
    id: sphereEntity

    property alias mesh: meshObject.source
    property alias material: materialObject.normal
    property alias diffuse: materialObject.diffuse
    property alias x: translate.dx
    property alias y: translate.dy
    property alias z: translate.dz

    Transform {
        id: transformObject

        Translate {
            id: translate
        }
    }

    NormalDiffuseMapMaterial {
        id: materialObject
        specular: Qt.rgba( 0.75, 0.75, 0.75, 1.0 )
        shininess: 10.0
    }

    Mesh {
        id: meshObject
    }

    components: [ meshObject, materialObject, transformObject ]
}
