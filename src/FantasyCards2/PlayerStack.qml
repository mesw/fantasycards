import QtQuick 2.0

Item {

    id: root

    implicitWidth: 271
    implicitHeight: 402

    Card {
        anchors.fill: parent
        state: "flippedPlayer"
        card: game.player
        MouseArea {
            anchors.fill: parent
            onPressed: {
                console.log(game)
                console.log(game.player)
                console.log(game.player.love)
            }
        }
    }

}
