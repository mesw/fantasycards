import QtQuick 2.0

Item {

    id: root

    property alias name: nameTxt.text

    state: "open"

    signal selected

    implicitHeight: 40
    implicitWidth: 60

    Rectangle {
        id: highlightRect
        anchors.fill: parent
        anchors.margins: root.width / 20
        border.color: "black"
        color: "white"
        opacity: 0.1

        radius: width / 6.9
    }

    Text {
        id: nameTxt
        text: "Intelligence"
        anchors.fill: parent
        anchors.margins: root.width / 15

        minimumPixelSize: 5
        font.pixelSize: 120
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter


    }

    MouseArea {
        anchors.fill: parent
        onPressed: selected()

    }

    states: [
        State {
            name: "open"
            PropertyChanges {
                target: highlightRect
                color: "white"
                opacity: 0.69
            }
        },
        State {
            name: "unselected"
            PropertyChanges {
                target: highlightRect
                color: "grey"
                opacity: 0.5
            }
        },
        State {
            name: "won"
            PropertyChanges {
                target: highlightRect
                color: "green"
                opacity: 0.42
            }
        },
        State {
            name: "lost"
            PropertyChanges {
                target: highlightRect
                color: "red"
                opacity: 0.37
            }
        }
    ]


}
