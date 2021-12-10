import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 500
    height: 500

    property alias startButton: startButton
    property alias tutorialButton: tutorialButton


    Rectangle {
        anchors.fill: parent
        color: "transparent"


        Button {
            id: startButton

            text: qsTr("Start Game")

            width: root.width / 3
            height: root.height / 8

            anchors.bottom: parent.verticalCenter
            anchors.topMargin: root.height / 8
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button {
            id: tutorialButton

            text: qsTr("Start Tutorial")

            width: root.width / 3
            height: root.height / 8

            anchors.top: parent.verticalCenter
            anchors.topMargin: root.height / 8
            anchors.horizontalCenter: parent.horizontalCenter
        }


        //        Image {
        //            id: menuBackgroundImage

        //            anchors.fill: parent
        //            fillMode: Image.PreserveAspectFit
        //            source: "https://mesw.github.io/fantasyarts"
        //        }

        //        Rectangle {
        //            id: startRect
        //            color: "grey"
        //            border.color: "white"
        //            opacity: 1.0

        //            width: root.width / 3
        //            height: root.height / 8

        //            anchors.bottom: parent.verticalCenter
        //            anchors.topMargin: root.height / 8
        //            anchors.horizontalCenter: parent.horizontalCenter

        //            Text {
        //                text: qsTr("Start Game")
        //                anchors.fill: parent
        //                horizontalAlignment: Text.AlignHCenter
        //                verticalAlignment: Text.AlignVCenter

        //                wrapMode: Text.WordWrap
        //            }

        //            MouseArea {
        //                anchors.fill: startRect
        //                onPressed: startGame()

        //            }

        //        }
        //        Rectangle {
        //        id: tutorialRect
        //        color: "grey"
        //        border.color: "white"
        //        opacity: 1.0

        //        width: root.width / 3
        //        height: root.height / 8

        //        anchors.top: parent.verticalCenter
        //        anchors.topMargin: root.height / 8
        //        anchors.horizontalCenter: parent.horizontalCenter


        //        Text {
        //            text: qsTr("Start Tutorial")
        //            anchors.fill: parent
        //            horizontalAlignment: Text.AlignHCenter
        //            verticalAlignment: Text.AlignVCenter

        //            wrapMode: Text.WordWrap
        //        }

        //        MouseArea {
        //            anchors.fill: tutorialRect
        //            onPressed: startTutorial()

        //        }
        //    }
    }



}
