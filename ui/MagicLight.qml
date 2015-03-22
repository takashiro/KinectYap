import QtQuick 2.4
import QtQuick.Particles 2.0

Item {
    id: root
    property real centerX: 0
    property real centerY: 0

    ParticleSystem { id: sys1 }
    ImageParticle {
        x: 0
        y: 0
        system: sys1
        source: "qrc:///particleresources/glowdot.png"
        color: "cyan"
        alpha: 0

        //The Color animation need to be temporarily off for the particles may be occasionally invisible
        /*SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation {
                from: "cyan"
                to: "magenta"
                duration: 1000
            }
            ColorAnimation {
                from: "magenta"
                to: "blue"
                duration: 2000
            }
            ColorAnimation {
                from: "blue"
                to: "violet"
                duration: 2000
            }
            ColorAnimation {
                from: "violet"
                to: "cyan"
                duration: 2000
            }
        }*/

        colorVariation: 0.3
    }
    Emitter {
        id: trailsNormal
        system: sys1

        x: centerX
        y: centerY

        emitRate: 500
        lifeSpan: 2000

        velocity: PointDirection {xVariation: 4; yVariation: 4;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}
        velocityFromMovement: 8

        size: 8
        sizeVariation: 4
    }

    ParticleSystem { id: sys2 }
    ImageParticle {
        color: "cyan"
        system: sys2
        alpha: 0
        SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation {
                from: "magenta"
                to: "cyan"
                duration: 1000
            }
            ColorAnimation {
                from: "cyan"
                to: "magenta"
                duration: 2000
            }
        }
        colorVariation: 0.5
        source: "qrc:///particleresources/star.png"
    }
    Emitter {
        id: trailsStars
        system: sys2

        x: centerX
        y: centerY

        emitRate: 100
        lifeSpan: 2200

        velocity: PointDirection {xVariation: 4; yVariation: 4;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}
        velocityFromMovement: 8

        size: 22
        sizeVariation: 4
    }

    ParticleSystem { id: sys3; }
    ImageParticle {
        source: "qrc:///particleresources/glowdot.png"
        system: sys3
        color: "orange"
        alpha: 0
        SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation {
                from: "red"
                to: "green"
                duration: 2000
            }
            ColorAnimation {
                from: "green"
                to: "red"
                duration: 2000
            }
        }

        colorVariation: 0.2

    }
    Emitter {
        id: trailsNormal2
        system: sys3

        x: centerX
        y: centerY

        emitRate: 300
        lifeSpan: 2000

        velocityFromMovement: 16

        velocity: PointDirection {xVariation: 4; yVariation: 4;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}

        size: 12
        sizeVariation: 4
    }

    ParticleSystem { id: sys4; }
    ImageParticle {
        system: sys4
        source: "qrc:///particleresources/star.png"
        color: "green"
        alpha: 0
        SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation {
                from: "green"
                to: "red"
                duration: 2000
            }
            ColorAnimation {
                from: "red"
                to: "green"
                duration: 2000
            }
        }

        colorVariation: 0.5
    }
    Emitter {
        id: trailsStars2
        system: sys4

        x: centerX
        y: centerY

        emitRate: 50
        lifeSpan: 2200

        velocityFromMovement: 16
        velocity: PointDirection {xVariation: 2; yVariation: 2;}
        acceleration: PointDirection {xVariation: 10; yVariation: 10;}

        size: 22
        sizeVariation: 4
    }
}
