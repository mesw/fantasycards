import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {

    id: root
    property bool flipped: true
    width: 542 /2
    height: 804 /2

    property real love: 10
    property real hate: 110
    property real strength: 10
    property real speed: 10
    property real intelligence: 0
    property real magic: 01
    property real brave: 01
    property real coward: 01
    property real cute: 10
    property real fear: 01
    property string imagePath: "path"

    property string caption: imagePath



    onFlippedChanged: rotationAnimation.running = true

    transform: Rotation {
        origin.x: frontImg.width/2
        origin.y: frontImg.height/2
        axis.x: 0.0
        axis.y: 1.0
        axis.z: 0.0

        RotationAnimation on angle {
            id: rotationAnimation
            from: 0
            to: 360
            duration: 1000
            loops: 1
        }

}



        Image {
            id: frontImg
            source: "https://mesw.github.io/fantasyarts/card/card.png"
            anchors.fill: parent
            visible: root.flipped


        }

        Image {
            id: backImg
            source: "https://mesw.github.io/fantasyarts/card/cardback.png"
            anchors.fill: parent
            visible: !frontImg.visible
        }

        Item {
            id: frontItem

            anchors.fill: parent
            visible:root.flipped

            Image {
                id: faceImg

                anchors.horizontalCenter: parent.horizontalCenter
                y: 37
                fillMode: Image.PreserveAspectCrop
                width: 238
                height: 133
                source: root.imagePath
                anchors.horizontalCenterOffset: 0

            }


            Text {
                id: captionTxt
                anchors.horizontalCenter: parent.horizontalCenter
                y: 11
                width: 230
                height: 20
                text: root.caption.replace("https://mesw.github.io/fantasyarts/faces/", "").replace(".png", " ")

                fontSizeMode: Text.Fit
                minimumPixelSize: 6
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenterOffset: 0
            }

            GridLayout {
                x: 20
                y: 170
                width: 232
                height: 220

                columns: 4
                rows: 5



                Text {
                    text: "Love"
                }

                Text {
                    text: root.love

                }

                Text {
                    text: "Hate"
                }

                Text {
                    text: root.hate
                }

                Text {
                    text: "Strength"
                }

                Text {
                    text: root.strength

                }

                Text {
                    text: "Speed"

                }

                Text {
                    text: root.speed

                }


                Text {
                    text: "Science"

                }

                Text {
                    text: root.intelligence

                }
                Text {
                    text: "Magic"

                }

                Text {
                    text: root.magic

                }

                Text {
                    text: "Brave"

                }

                Text {
                    text: root.brave

                }

                Text {
                    text: "Coward"

                }

                Text {
                    text: root.coward

                }

                Text {
                    text: "Cute"

                }

                Text {
                    text: root.cute

                }
                Text {
                    text: "Fear"

                }

                Text {
                    text: root.fear

                }
            }
        }
    }
