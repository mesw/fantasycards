import QtQuick 2.0

Item {

    id: root

    implicitWidth: 271
    implicitHeight: 402

    property real xByX : game.level

    property real cols: xByX
    property real rows: xByX

    Grid {
        id: enemyGrid
        anchors.fill: parent

        spacing: 1

        columns: root.cols
        rows: root.rows

        Repeater {
            model: root.cols * root.rows
            Card {
                width: root.width / root.cols - enemyGrid.spacing
                height: root.height / root.rows - enemyGrid.spacing
                state: "covered"
                MouseArea {
                    anchors.fill: parent
                    onPressed: {

                        if (!game.over)
                            activeCard.visible = true
                        else {

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
