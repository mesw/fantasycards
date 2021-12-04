import QtQuick 2.0

Item {

    id: root

    property alias name: nameTxt.text
    property real value: 100

    implicitHeight: 40
    implicitWidth: 60

    Text {
        id: nameTxt
        text: "Intelligence"
        height: parent.height * 0.42
        width: parent.width

        minimumPixelSize: 5
        font.pixelSize: 120
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter


    }
    Text {
        id: valueTxt
        text: Math.round(root.value).toString()
        height: parent.height *0.58
        width: parent.width
        anchors.top: nameTxt.bottom
        minimumPixelSize: 5
        font.pixelSize: 120
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter


    }
}
