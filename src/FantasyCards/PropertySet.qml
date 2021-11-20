import QtQuick
import QtQuick.Controls


Item {
id: root

width: 100
height: 10

property string positiveName: "positive"
property string negativeName: "negative"
property string groupName: "group"

property real positive: 2
property real negative: 2
property real group: 0


Grid {
    anchors.fill: parent
    rows: 3
    columns: 2

Text {
    id: groupTxt
    text: groupName
}

ProgressBar {
    from:  0
    to: 100
    value: group


}


Text {
    id: negativeTxt
    text: negativeName
}

ProgressBar {
    from:  0
    to: 100
    value: negative

}

Text {
    id: positiveTxt
    text: positiveName
}

ProgressBar {
    from:  0
    to: 100
    value: positive

}
}
}
