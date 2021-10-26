import QtQuick
import QtQuick.Controls
import QtQuick.Window
import My.example.cardRandomizer 1.0


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Card {
        id: myCard
        width: 300
        height: 400
        anchors.centerIn: parent
        love: MyCardRandomizer.love
        hate: MyCardRandomizer.hate


        strength: MyCardRandomizer.strength
        speed: MyCardRandomizer.speed
        intelligence: MyCardRandomizer.intelligence
        magic: MyCardRandomizer.magic
        brave: MyCardRandomizer.brave
        coward: MyCardRandomizer.coward
        cute: MyCardRandomizer.cute
        fear: MyCardRandomizer.fear

    }


Button {
    anchors.right: parent.right
    anchors.bottom: parent.bottom

    text: "randomize card"

    onPressed: {
        MyCardRandomizer.randomize();

    }
}

}
