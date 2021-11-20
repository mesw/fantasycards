import QtQuick
import QtQuick.Controls
import QtQuick.Window
import My.example.worldCardRandomizer 1.0
import My.example.playerCardRandomizer 1.0
import My.example.playerCards 1.0


Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Image {
        id: backgroundImg

        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        source: "https://mesw.github.io/fantasyarts/background/cave/fossil_cave.png"
    }

    Button {
        id: creditsBtn

        text: "Credits"

        onPressed: creditsPopup.open()
    }

    Popup {
        id: creditsPopup

        width: parent.width / 2
        height: parent.height / 2

        anchors.centerIn: parent

        modal: true
        focus: true
        closePolicy: Popup.CloseOnPressOutside

        ScrollView {
            anchors.fill: parent

            TextArea {
                anchors.fill: parent

                text: "\
\n\"Trading Card Template\" by Avery Ross licensed CC-BY 4.0: https://opengameart.org/content/trading-card-template\
\nModified by mesw licensed under CC-BY 4.0\
\nOriginal files are in folder AtkDefTCGTemplate\
\n\
\n\"Fossil Cave\" by Écrivain licensed under CC0: https://opengameart.org/content/fossil-cave\
\nModified by mesw licensed under CC0\
\nThe original file can be found in the folder: original\
\n\
\nAI generated faces by mesw\
\n\
"
            }
        }

    }
    PlayingCard {
        id: testCard

        love: PlayerCards.card.love
        hate: PlayerCards.card.hate
        strength: PlayerCards.card.strength
        speed: PlayerCards.card.speed
        intelligence: PlayerCards.card.intelligence
        magic: PlayerCards.card.magic
        brave: PlayerCards.card.brave
        coward: PlayerCards.card.coward
        cute: PlayerCards.card.cute
        fear: PlayerCards.card.fear

        imagePath: PlayerCardRandomizer.imagePath

        flipped: false

        anchors.centerIn: parent
    }

    MouseArea {
        id: cardClickMouseArea

        anchors.fill: testCard

        onPressed: {
            PlayerCardRandomizer.randomize();

            if  (testCard.flipped == true)
                testCard.flipped = false

            testCard.flipped = true
        }
    }


    Item {
        id: cardTestItem
        visible: false

        Card {
            id: playerCard
            width: root.width / 4
            height: width * 1.567

            anchors.left: parent.left
            anchors.leftMargin: width / 2
            anchors.verticalCenter: parent.verticalCenter

            love: PlayerCardRandomizer.love
            hate: PlayerCardRandomizer.hate


            strength: PlayerCardRandomizer.strength
            speed: PlayerCardRandomizer.speed
            intelligence: PlayerCardRandomizer.intelligence
            magic: PlayerCardRandomizer.magic
            brave: PlayerCardRandomizer.brave
            coward: PlayerCardRandomizer.coward
            cute: PlayerCardRandomizer.cute
            fear: PlayerCardRandomizer.fear

            imagePath: PlayerCardRandomizer.imagePath

        }

        Card {
            id: worldCard
            width: root.width / 4
            height: width * 1.567

            anchors.right: parent.right
            anchors.rightMargin: width / 2
            anchors.verticalCenter: parent.verticalCenter

            love: WorldCardRandomizer.love
            hate: WorldCardRandomizer.hate


            strength: WorldCardRandomizer.strength
            speed: WorldCardRandomizer.speed
            intelligence: WorldCardRandomizer.intelligence
            magic: WorldCardRandomizer.magic
            brave: WorldCardRandomizer.brave
            coward: WorldCardRandomizer.coward
            cute: WorldCardRandomizer.cute
            fear: WorldCardRandomizer.fear

            imagePath: WorldCardRandomizer.imagePath

        }

        Button {
            anchors.top: playerCard.bottom
            anchors.right: playerCard.right

            text: "randomize player"

            onPressed: {
                PlayerCardRandomizer.randomize();

            }
        }

        Button {
            anchors.top: worldCard.bottom
            anchors.right: worldCard.right

            text: "randomize world"

            onPressed: {
                WorldCardRandomizer.randomize();

            }
        }

        Column {

            width: 100
            height: 400

            anchors.centerIn: parent

            Button {
                text: "Body"
            }
            Button {
                text: "Soul"
            }
            Button {
                text: "Wisdom"
            }
            Button {
                text: "Intelligence"
            }
            Button {
                text: "Power"
            }

            //    body = ["Body","Strength","Speed"]

            //    soul = ["Soul","Love","Hate"]

            //    wisdom = ["Wisdom", "Brave", "Coward"]

            //    intelligence = ["Intelligence","Science","Magic"]

            //    power = ["Power", "Cute", "Fear"]

        }

    }
}
