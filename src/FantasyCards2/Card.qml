import QtQuick 2.0
import QtQuick.Controls 2.15


Item {

    id: root

    property var card

    state: "covered"

    implicitWidth: 271
    implicitHeight: 402

    property string selectedStat: ""
    property string formerState: ""

    function enemySelect(stat) {
        root.formerState = root.state
        root.selectedStat = stat
        root.state = "flippedEnemyShow"
        proceedMouseArea.visible = true
    }

    function proceed() {
        game.enemySelect(selectedStat)
        root.state = root.formerState
        proceedMouseArea.visible = false
        visible = !game.over

    }

    Image {
        id: frontImage
        source: "https://mesw.github.io/fantasyarts/card/card.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    Image {
        id: backImage
        source: "https://mesw.github.io/fantasyarts/card/cardback.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }


    Rectangle {
        id: accentRect
        anchors.fill: parent
        color: "red"
        radius: root.width /19
        opacity: 0.20
        visible: false
    }

    states: [
        State {
            name: "flippedPlayer"
            PropertyChanges { target: frontImage; visible: true }
            PropertyChanges { target: backImage; visible: false }
            PropertyChanges { target: accentRect; visible: false }
            PropertyChanges { target: faceImg; visible: true }
            PropertyChanges { target: titleTxt; visible: true }
            PropertyChanges { target: statsGrid; visible: true }
            PropertyChanges { target: statsSelectGrid; visible: false }


        },
        State {
            name: "flippedEnemyHidden"
            PropertyChanges { target: frontImage; visible: true }
            PropertyChanges { target: backImage; visible: false }
            PropertyChanges { target: accentRect; visible: false }
            PropertyChanges { target: faceImg; visible: true }
            PropertyChanges { target: titleTxt; visible: true }
            PropertyChanges { target: statsGrid; visible: false }
            PropertyChanges { target: statsSelectGrid; visible: true }


        },
        State {
            name: "flippedEnemyShow"
            PropertyChanges { target: frontImage; visible: true }
            PropertyChanges { target: backImage; visible: false }
            PropertyChanges { target: accentRect; visible: false }
            PropertyChanges { target: faceImg; visible: true }
            PropertyChanges { target: titleTxt; visible: true }
            PropertyChanges { target: statsGrid; visible: true }
            PropertyChanges { target: statsSelectGrid; visible: false }


        },
        State {
            name: "covered"
            PropertyChanges { target: frontImage; visible: false }
            PropertyChanges { target: backImage; visible: true }
            PropertyChanges { target: accentRect; visible: false }
            PropertyChanges { target: faceImg; visible: false }
            PropertyChanges { target: titleTxt; visible: false }
            PropertyChanges { target: statsGrid; visible: false }
            PropertyChanges { target: statsSelectGrid; visible: false }


        },
        State {
            name: "coveredWinner"
            PropertyChanges { target: frontImage; visible: true }
            PropertyChanges { target: backImage; visible: false; }
            PropertyChanges { target: accentRect; visible: false }
            PropertyChanges { target: faceImg; visible: false }
            PropertyChanges { target: titleTxt; visible: false }
            PropertyChanges { target: statsGrid; visible: false }
            PropertyChanges { target: statsSelectGrid; visible: false }


        },
        State {
            name: "defeated"
            PropertyChanges { target: frontImage; visible: false }
            PropertyChanges { target: backImage; visible: false; }
            PropertyChanges { target: accentRect; visible: false }
            PropertyChanges { target: faceImg; visible: false }
            PropertyChanges { target: titleTxt; visible: false }
            PropertyChanges { target: statsGrid; visible: false }
            PropertyChanges { target: statsSelectGrid; visible: false }

        }

    ]


    Rectangle {
        id: faceImg
        anchors.horizontalCenter: parent.horizontalCenter
        y:  root.height * 0.1
        width:  root.width * 0.9
        height: root.height * 0.3

        radius:  root.height * 0.05

        border.color:"black"

        clip: true

        color: "transparent"

        Image {
            anchors.fill: parent
            source: card.imagePath
            fillMode: Image.PreserveAspectCrop
            visible: true
        }

    }

    Text {
        id: titleTxt

        text: card.cardName

        width: root.width * 0.85
        height: root.height / 15
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height * 0.03

        minimumPixelSize: 6
        font.pixelSize: 120
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter


    }

    Grid {
        id: statsGrid

        columns: 3
        rows: 5

        width: root.width * 0.85
        height: root.height * 0.54
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height * 0.42

        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Strength"; value: card.strength }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Body"; value: card.body }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Speed"; value: card.speed }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Coward"; value: card.coward }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Wisdom"; value: card.wisdom }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Brave"; value: card.brave }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Cute"; value: card.cute }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Power"; value: card.power }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Fear"; value: card.fear }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Love"; value: card.love }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Soul"; value: card.soul }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Hate"; value: card.hate }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Science"; value: card.science }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Intelligence"; value: card.intelligence }
        Stat { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Magic"; value: card.magic }

    }

    Grid {
        id: statsSelectGrid

        columns: 3
        rows: 5

        width: root.width * 0.85
        height: root.height * 0.54
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height * 0.42

        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Strength"; onSelected: enemySelect("strength");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Body"; onSelected: enemySelect("body");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Speed"; onSelected: enemySelect("speed");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Coward"; onSelected: enemySelect("coward");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Wisdom"; onSelected: enemySelect("wisdom");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Brave"; onSelected: enemySelect("brave");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Cute"; onSelected: enemySelect("cute");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Power"; onSelected: enemySelect("power");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Fear"; onSelected: enemySelect("fear");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Love"; onSelected: enemySelect("love");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Soul"; onSelected: enemySelect("soul");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Hate"; onSelected: enemySelect("hate");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Science"; onSelected: enemySelect("science");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Intelligence"; onSelected: enemySelect("intelligence");}
        StatSelect { width: statsGrid.width / 3; height: statsGrid.height / 5; name: "Magic"; onSelected: enemySelect("magic");}

    }

    MouseArea {
        id: proceedMouseArea
        anchors.fill: parent

        visible: false

        onPressed: proceed()
    }

}

