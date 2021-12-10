import QtQuick 2.0

Item {

    id: root

    implicitWidth: 271
    implicitHeight: 402

    property real xByX : game.level

    Grid {
        id: enemyGrid
        anchors.fill: parent

        spacing: 1

        columns: root.xByX
        rows: root.xByX

        Repeater {
            model: root.xByX * root.xByX
            Card {
                width: root.width / root.xByX - enemyGrid.spacing
                height: root.height / root.xByX - enemyGrid.spacing
                state: "covered"
                MouseArea {
                    anchors.fill: parent
                    onPressed: {

                        if (!game.over)
                            activeCard.visible = true
                        else {
                            if (game.playerCardCount > 0)
                                game.shuffleEnemy()
                            activeCard.visible = true
                        }
                    }
                }
            }
        }
    }

    Card {
        id: activeCard

        anchors.fill: parent
        card: game.enemy

        state: "flippedEnemyHidden"

        visible: false


    }


}
