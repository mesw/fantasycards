import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")




    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: "black"
    }

    Image {
        anchors.fill: parent

        source: "https://mesw.github.io/fantasyarts/background/cave/fossil_cave.png"
        fillMode: Image.PreserveAspectCrop
    }


    Rectangle {
        id: wonIndocator
        anchors.centerIn: playArea
        height: playArea.width * 1.1
        width: playArea.height * 1.1

        rotation: -90

        color: "red"

        radius: (width+height) / 30

        opacity: 0.5

        visible: game.winner > 0

        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.25; color: "green" }
            GradientStop { position: 0.5; color: "transparent" }
        }


    }

    Rectangle {
        id: lostIndocator
        anchors.centerIn: playArea
        height: playArea.width * 1.1
        width: playArea.height * 1.1

        rotation: -90

        color: "red"

        radius: (width+height) / 30

        visible: game.winner < 0

        opacity: 0.5

        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.25; color: "red" }
            GradientStop { position: 0.5; color: "transparent" }
        }


    }




    Text {
        id: cardCountTxt
        text: "Progress " + game.playerCardCount + " vs " + game.enemyCardCount
        anchors.left: root.left
        anchors.top: root.top

        color: "white"
    }

    Row {
        id: playArea
        anchors.fill: parent
        anchors.margins: ( Math.sqrt(root.width * root.height) ) / 10
        spacing: ( Math.sqrt(root.width * root.height) ) / 20
        PlayerStack {
            id: playerStack
            width: playArea.width / playArea.height > (271*2) / 402 ? ( implicitWidth / implicitHeight ) * height : playArea.width / 2
            height: playArea.width / playArea.height > (271*2) / 402 ? playArea.height : ( implicitHeight / implicitWidth ) * width
        }


        EnemyStack {
            id: enemyStack
            width: playArea.width / playArea.height > (271*2) / 402 ? ( implicitWidth / implicitHeight ) * height : playArea.width / 2
            height: playArea.width / playArea.height > (271*2) / 402 ? playArea.height : ( implicitHeight / implicitWidth ) * width
        }
    }

    Button {
        id: creditsButton
        text: "Credits"
        anchors.right: parent.right
        anchors.top: parent.top
        onPressed:         creditsPopup.open();
    }

    function setText(url) {
         var doc = new XMLHttpRequest();
         doc.onreadystatechange = function() {
             if (doc.readyState == XMLHttpRequest.DONE) {
                 mainText.text = doc.responseText;
             }
         }
         doc.open("get", url);
         doc.setRequestHeader("Content-Encoding", "UTF-8");
         doc.send();
     }

    Popup {
        id: creditsPopup

        width: parent.width
        height: parent.height
        visible: false

        modal: false

        TextArea {

            id: credit1

            selectByMouse: true
            selectByKeyboard: true
            readOnly: true
            anchors.fill: parent

            font.pointSize: 10

            text: "
This game was created as a submission for the OpenGameArt Late Fall Jam 2021
https://opengameart.org/content/opengameart-late-fall-game-jam-2021

Created with Qt for WebAssembly

Assets used:

1.)
\"Fossil Cave\" by Écrivain licensed under CC0: https://opengameart.org/content/fossil-cave
Modified by mesw licensed under CC0
The original file can be found in the folder: original

2.)
\"Trading Card Template\" by Avery Ross licensed CC-BY 4.0: https://opengameart.org/content/trading-card-template
Modified by mesw licensed under CC-BY 4.0
Original files are in folder AtkDefTCGTemplate

3.)

4.)

5.)

6.)


thank you to everybody who gave input!

special thanks to wolfi who owns the original card set that was the inspiration for this game.

greetings to everybody who plays this. Have fun!
"
        }

        Button {
            anchors.top: parent.top
            anchors.right: parent.right
            text: "X"
            onPressed: creditsPopup.close()
        }
    }
}
