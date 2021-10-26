import QtQuick
import QtQuick.Controls
Item {
    id: root

    property string name: "Default"
    property real value: 50

    width: 100
    height: 40


    Rectangle {
        anchors.fill: parent
    }

    Text {
        id: nameTxt
        text: root.name
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.margins: root.height / 8
        width: parent.width-anchors.margins * 2
        height: parent.height / 2
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        minimumPixelSize: 6
        font.pixelSize: root.height
    }

    Slider {
        id: control
        anchors.top: nameTxt.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        from: 0
        to: 100
        value: root.value
        onMoved: root.value = value

        enabled: false
        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: control.width
            implicitHeight: control.height / 10
            width: control.availableWidth
            height: implicitHeight
            radius: 2
            color: "#bdbebf"

            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                color: "#21be2b"
                radius: 2
            }
        }

        handle: Rectangle {
            x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: root.height/ 2
            implicitHeight: root.height/ 2
            radius: root.height/ 2
            color: control.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"

            Text {
                id: valueTxt

                anchors.fill: parent
                anchors.margins: 2

                text: control.value

                font.pixelSize: 10
                minimumPixelSize: 3
                fontSizeMode: Text.Fit
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:8}
}
##^##*/
