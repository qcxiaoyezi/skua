import QtQuick 2.2
import QtGraphicalEffects 1.0


Item{
    id: btn
    width: 29; height: 25

    property int radius: 3
    property color hightLightColor: "#828282"
    property color bodyColorGs1: "#6b6b6b"
    property color bodyColorGs2: "#545454"
    property alias image: image
    property alias mouseArea: mouseArea
    property alias body: body

    Item{
        id: effectItem
        anchors.fill: parent
        clip: true

        Rectangle{
            id: body
            anchors.fill: parent;
            anchors{topMargin: -radius;}
            radius:btn.radius;
            gradient: Gradient {
                GradientStop {position: 0.0; color: bodyColorGs1 }
                GradientStop {position: 1.0; color: bodyColorGs2 }
            }
        }
        Rectangle{width: parent.width;height: 1; color: hightLightColor}
    }

    Image{
        id: image
        anchors.centerIn: parent
    }
    MouseArea{
        id: mouseArea;
        hoverEnabled: true;
        anchors.fill: parent;
    }
    state: mouseArea.pressed ? "press" : mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges{target: effectItem; visible: true}
            PropertyChanges{target: btn; hightLightColor: "#828282";
                bodyColorGs1:"#707070"; bodyColorGs2: "#545454"}
        },
        State {
            name: "hover" ;
            PropertyChanges{target: effectItem; visible: true}
            PropertyChanges{target: btn; hightLightColor: "#a0a0a0";
                bodyColorGs1:"#848484"; bodyColorGs2: "#6d6d6d"}
        },
        State {
            name: "press" ;
            PropertyChanges{target: effectItem; visible: false}
        }
    ]
}
