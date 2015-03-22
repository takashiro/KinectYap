import QtQuick 2.4
import QtQuick.Particles 2.0

Item {
    property real centerX: 0
    property real centerY: 0

    ParticleSystem {
        ImageParticle {
            x: 0
            y: 0
            source: "qrc:///particleresources/glowdot.png"
            color: "cyan"
            alpha: 0
        }
        Emitter {
            id: trailsNormal

            x: centerX
            y: centerY

            emitRate: 250
            lifeSpan: 1000

            velocity: PointDirection {xVariation: 4; yVariation: 4;}
            acceleration: PointDirection {xVariation: 10; yVariation: 10;}
            velocityFromMovement: 8

            size: 8
            sizeVariation: 4
        }
    }


    ParticleSystem {
        ImageParticle {
            color: "cyan"
            alpha: 0
            source: "qrc:///particleresources/star.png"
        }
        Emitter {
            x: centerX
            y: centerY

            emitRate: 50
            lifeSpan: 1100

            velocity: PointDirection {xVariation: 4; yVariation: 4;}
            acceleration: PointDirection {xVariation: 10; yVariation: 10;}
            velocityFromMovement: 8

            size: 22
            sizeVariation: 4
        }
    }


    ParticleSystem {
        ImageParticle {
            source: "qrc:///particleresources/glowdot.png"
            color: "green"
            alpha: 0
        }
        Emitter {
            x: centerX
            y: centerY

            emitRate: 150
            lifeSpan: 1000

            velocityFromMovement: 16

            velocity: PointDirection {xVariation: 4; yVariation: 4;}
            acceleration: PointDirection {xVariation: 10; yVariation: 10;}

            size: 12
            sizeVariation: 4
        }
    }


    ParticleSystem {
        ImageParticle {
            source: "qrc:///particleresources/star.png"
            color: "red"
            alpha: 0
        }
        Emitter {
            x: centerX
            y: centerY

            emitRate: 25
            lifeSpan: 1100

            velocityFromMovement: 16
            velocity: PointDirection {xVariation: 2; yVariation: 2;}
            acceleration: PointDirection {xVariation: 10; yVariation: 10;}

            size: 22
            sizeVariation: 4
        }
    }
}
