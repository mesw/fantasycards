import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item {
        anchors.fill: parent

        Rectangle {

            width: 300
            height: 400
            anchors.centerIn: parent

            color: "green"
        }

        Text {
            anchors.centerIn: parent
            text: "Hello webassembly"
        }

        Button {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            text: "click me"

        }

        Slider {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            from: 0
            to: 100
            value: 50
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.25}
}
##^##*/
