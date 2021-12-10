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
        id: backgroundImg
        anchors.fill: parent

        source: "https://mesw.github.io/fantasyarts/background/cave/fossil_cave.png"
        fillMode: Image.PreserveAspectCrop
    }

    Item {
        id: gameItem
        anchors.fill: parent

        visible: false

        Rectangle {
            id: wonIndocator

            anchors.top: playArea.top
            anchors.bottom: playArea.bottom
            anchors.left: playArea.left
            anchors.right: playArea.right

            //        rotation: -90

            color: "red"

            opacity: 0.75

            visible: game.winner > 0

            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0.0; color: "green" }
                GradientStop { position: 0.45; color: "transparent" }
                GradientStop { position: 0.55; color: "transparent" }
                GradientStop { position: 1.0; color: "red" }
            }


        }

        Rectangle {
            id: lostIndocator

            anchors.top: playArea.top
            anchors.bottom: playArea.bottom
            anchors.left: playArea.left
            anchors.right: playArea.right

            //        rotation: -90

            color: "red"

            radius: (width+height) / 30

            visible: game.winner < 0

            opacity: 0.75

            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0.0; color: "red" }
                GradientStop { position: 0.45; color: "transparent" }
                GradientStop { position: 0.55; color: "transparent" }
                GradientStop { position: 1.0; color: "green" }
            }


        }


        Image {

            id: enemyNumberOfCardsImage
            source: "https://mesw.github.io/fantasyarts/frame/boxNormal.png"
            anchors.left: playArea.horizontalCenter
            anchors.verticalCenter: playArea.verticalCenter


            Text {
                id: enemyNumberOfCardsTxt
                text: game.enemyCardCount
                anchors.centerIn: parent

                fontSizeMode: Text.Fit
                font.pixelSize: enemyStack.height / 10

                color: "white"
            }
        }
        Image {
            source: "https://mesw.github.io/fantasyarts/frame/boxNormal.png"
            anchors.right: playArea.horizontalCenter
            anchors.verticalCenter: playArea.verticalCenter

            Text {
                id: playerNumberOfCardsTxt
                text: game.playerCardCount

                anchors.centerIn: parent

                fontSizeMode: Text.Fit
                font.pixelSize: enemyStack.height / 10

                color: "white"
            }
        }
        Rectangle {
            id: playArea
            anchors.fill: parent
            anchors.margins: ( Math.sqrt(root.width * root.height) ) / 10

            color: "transparent"

            PlayerStack {
                id: playerStack
                width: playArea.width / playArea.height > (271*2) / 402 ? ( implicitWidth / implicitHeight ) * height : playArea.width / 2
                height: playArea.width / playArea.height > (271*2) / 402 ? playArea.height : ( implicitHeight / implicitWidth ) * width

                anchors.left: playArea.left
                anchors.top: playArea.top
                anchors.bottom: playArea.bottom
            }

            EnemyStack {
                id: enemyStack
                width: playArea.width / playArea.height > (271*2) / 402 ? ( implicitWidth / implicitHeight ) * height : playArea.width / 2
                height: playArea.width / playArea.height > (271*2) / 402 ? playArea.height : ( implicitHeight / implicitWidth ) * width

                anchors.right: playArea.right
                anchors.top: playArea.top
                anchors.bottom: playArea.bottom
            }
        }

        AnimatedSprite {
            id: tutorialEyeImage
            source: "https://mesw.github.io/fantasyarts/eye/eyeball.png"
            frameCount: 4
            frameDuration: 1200
            frameHeight: 64
            frameWidth: 256 / 4
            frameRate: 6
            anchors.right: playArea.left
            anchors.bottom: playArea.top
        }

        Text {
            id: tutorialEyeText
            text: qsTr("This is your card stack. Not great, isn't it?")

            color: "white"

            anchors.left: playArea.left
            anchors.bottom: playArea.top
            anchors.bottomMargin: height
        }

        Image {
            id: tutorialWizardImage
            source: "https://mesw.github.io/fantasyarts/wizard/magic_flipped.png"
            anchors.left: playArea.right
            anchors.top: playArea.bottom

        }

        Text {
            id: tutorialWizardText
            text: qsTr("This is the enemy stack. Go ahead, click it!")

            color: "white"

            anchors.right: playArea.right
            anchors.top: playArea.bottom
            anchors.topMargin: height
        }

        Image {
            id: tutorialOctopusImage
            source: "https://mesw.github.io/fantasyarts/octopus/cuttlefish.png"
            anchors.right: enemyNumberOfCardsImage.left
            anchors.bottom: enemyNumberOfCardsImage.top
            anchors.bottomMargin: (height * 0.1) * -1
            width: enemyNumberOfCardsImage.width
            height: enemyNumberOfCardsImage.height
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: tutorialOctopusText
            text: qsTr("
This is your score.
Try to maximize the left number and minimize the right number.
The colors in the background show you who won the last round.

Select a stat on the enemy card to see who wins. If your card
is better than the enemy card in the selecte stat, you can
keep the enemy card. If you are not better, your card will
be destroyed.

When the enemy stack is empty, it is reborn stronger than before.
See how long you can keep up!
")

            color: "white"

            anchors.horizontalCenter: playArea.horizontalCenter
            anchors.top: enemyNumberOfCardsImage.bottom

        }

    }

    Rectangle {
        id: creditsButton

        anchors.right: parent.right
        anchors.top: parent.top
        width: parent.width / 10
        height: parent.height / 10

        color: "black"
        border.color: "white"

        Image {
            id: creditsRose
            source: "https://mesw.github.io/fantasyarts/rose/rose.png"

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: parent.height * 0.125
            height: parent.height * 0.75
            fillMode: Image.PreserveAspectFit

        }

        Text {
            id: creditsButtonText
            text: "Credits"
            color: "white"
            anchors.fill: parent

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onPressed: creditsPopup.open();
        }

    }

    Popup {
        id: creditsPopup

        width: parent.width
        height: parent.height
        visible: false

        modal: false

        background: Rectangle {
            color: "black"
        }


        ScrollView {
            anchors.fill: parent
            TextArea {

                id: creditText

                selectByMouse: true
                selectByKeyboard: true
                readOnly: true
                anchors.fill: parent
                background: Rectangle {
                    color: "black"
                    anchors.fill: parent
                    Image {
                        id: creditsBackground
                        anchors.fill: parent
                        opacity: 0.2
                        source: "https://mesw.github.io/fantasyarts/background/cave/fossil_cave.png"
                        fillMode: Image.PreserveAspectCrop
                    }
                }
                color: "lightblue"
                font.pointSize: 20
                wrapMode: Text.WordWrap

                textFormat: TextArea.MarkdownText

                ScrollBar {

                    policy: ScrollBar.AlwaysOn

                }
                onLinkActivated: Qt.openUrlExternally(link)

                text: "
# Fantasy Cards

This game was created as a submission for the [OpenGameArt Late Fall Jam 2021](https://opengameart.org/content/opengameart-late-fall-game-jam-2021)

Created with [Qt for WebAssembly](https://doc.qt.io/qt-5/wasm.html)

## Assets used:

### 1.) [\"Fossil Cave\"](https://opengameart.org/content/fossil-cave) by Écrivain licensed under CC0
Modified by mesw licensed under CC0.
The original file can be found in the folder: original

### 2.) [\"Trading Card Template\"](https://opengameart.org/content/trading-card-template) by Avery Ross licensed CC-BY 4.0
Modified by mesw licensed under CC-BY 4.0.
Original files are in folder AtkDefTCGTemplate

### 3.) [\"Fantasy UI Box\"](https://opengameart.org/content/fantasy-ui-box) by StumpyStrust licensed CC-0
unchanged

### 4.) [\"Floating Eyeball\"](https://opengameart.org/content/floating-eyeball-0) by OwlishMedia licensed CC-0
unchanged

### 5.) [\"Cuttle Fish portrait\"](https://opengameart.org/content/cuttle-fish-portrait) by fmunoz.geo licensed CC0
unchanged

### 6.) [\"Wizard\"](https://opengameart.org/content/wizard-0) by Blarumyrran (blarumyrran@gmail.com) licensed CC-0
flipped and added transparency by mesw licensed under CC-0.
the original file is called magic.png

### 7.) [\"Rose Flower (pyxeledit document and image)\"](https://opengameart.org/content/rose-flower-pyxeledit-document-and-image) by Lovecraft licensed CC-0
unchanged

## Thank you to everybody who gave input!

Special thanks to wolfi who owns the original card set that was the inspiration for this game.

Greetings to everybody who plays this. Have fun!
"

            }
        }

        Button {
            anchors.top: parent.top
            anchors.right: parent.right
            text: "X"
            onPressed: creditsPopup.close()
        }

        Image {
            id: creditsBigRose
            source: "https://mesw.github.io/fantasyarts/rose/rose.png"

            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: parent.height * 0.125
            height: parent.height * 0.75
            fillMode: Image.PreserveAspectFit

        }

    }

    Rectangle  {
        id: menuPopup

        anchors.fill: parent

        color: "transparent"

        GameMenu {
            anchors.fill: parent
            tutorialButton.onPressed: {
                console.log("start tutorial")
                menuPopup.visible = false
                gameItem.visible = true
                tutorialItem.visible = true
                tutorialEyeImage.visible = true
                tutorialEyeText.visible = true
                tutorialOctopusImage.visible = true
                tutorialOctopusText.visible = true
                tutorialWizardImage.visible = true
                tutorialWizardText.visible = true
            }
            startButton.onPressed: {
                console.log("start game")
                menuPopup.visible = false
                gameItem.visible = true
                tutorialEyeImage.visible = false
                tutorialEyeText.visible = false
                tutorialOctopusImage.visible = false
                tutorialOctopusText.visible = false
                tutorialWizardImage.visible = false
                tutorialWizardText.visible = false
            }

        }
    }

}
