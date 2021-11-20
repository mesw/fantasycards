import QtQuick

Item {
    id: root
    width: 200
    height: 50

    property string positiveName: "Positive"
    property string negativeName: "Negative"
    property string baseName: "Base"
    property real positiveValue: 50
    property real negativeValue: 50
    property real baseValue: (positiveValue+negativeValue)/2 // Math.abs(positiveValue-negativeValue)


    property bool toggled: true


    PropertyBar {
        id: positiveBar
        name: positiveName
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: baseBar.left
        anchors.margins: 3

        value: positiveValue
        visible: false
    }
    PropertyBar {
        id: negativeBar
        name: negativeName
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: baseBar.right
        anchors.margins: 3

        value: negativeValue
        visible: false
    }

    PropertyBar {
        id: baseBar
        name: baseName
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 3

        width: toggled ? root.width : root.width / 3
        value: baseValue


    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            toggled = !toggled
            positiveBar.visible = !positiveBar.visible
            negativeBar.visible = !negativeBar.visible
        }
    }
}
