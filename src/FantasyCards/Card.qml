import QtQuick
import QtQuick.Controls


Item {

    id: root

    property real love: 0
    property real hate: 0
    property real strength: 0
    property real speed: 0
    property real intelligence: 0
    property real magic: 0
    property real brave: 0
    property real coward: 0
    property real cute: 0
    property real fear: 0


    width: 300
    height: 100

    Rectangle {
        id: backgroundRect
        anchors.fill: parent

        border.color: "black"
        border.width: 3
    }

    Rectangle {
        id: imageRect
anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        height: parent.height /3 -10
        width: parent.width - 10

        color: "black"

        radius: 5
    }

    Column {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: imageRect.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 5

        PropertyPack {

            width: parent.width
            height: parent.height / 5

            baseName: "Soul"
            positiveName: "Love"
            negativeName: "Hate"

            positiveValue: root.love
            negativeValue: root.hate
        }

        PropertyPack {

            width: parent.width
            height: parent.height / 5

            baseName: "Body"
            positiveName: "Strength"
            negativeName: "Speed"

            positiveValue: root.strength
            negativeValue: root.speed
        }

        PropertyPack {

            width: parent.width
            height: parent.height / 5

            baseName: "Mind"
            positiveName: "Intelligence"
            negativeName: "Magic"

            positiveValue: root.intelligence
            negativeValue: root.magic
        }

        PropertyPack {

            width: parent.width
            height: parent.height / 5

            baseName: "Instinct"
            positiveName: "Brave"
            negativeName: "Coward"

            positiveValue: root.brave
            negativeValue: root.coward
        }
        PropertyPack {

            width: parent.width
            height: parent.height / 5

            baseName: "Power"
            positiveName: "Cute"
            negativeName: "Fear"

            positiveValue: root.cute
            negativeValue: root.fear


        }

    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
