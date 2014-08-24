import QtQuick 2.2
import "../text"

Item{
    id: button
    width: Math.ceil(text.width) + 16 /*取整避免出现非整数的模糊现象*/
    height:  26

    property alias text: text.text
    property int radius: 2
    property color boderColor: "#6a6a6a"
    property color bodyColorGs1: "#717171"
    property color bodyColorGs2: "#606060"


    Item{
        id: effectItem
        anchors.fill: parent
        anchors.topMargin: 1

        Rectangle{
            anchors.fill: parent
            anchors.topMargin: button.radius
            radius: button.radius;
            border{width: 1; color: "#6a6a6a"}
        }
        Rectangle{
            anchors.fill: parent
            anchors.bottomMargin: 1
            radius: button.radius;
            border{width: 1; color: "#2c2c2c"}
            gradient: Gradient {
                GradientStop {id:gs1; position: 0.0; color: bodyColorGs1 }
                GradientStop {id:gs2; position: 1.0; color: bodyColorGs2 }
            }
            Rectangle{
                id: hightlight
                anchors{left: parent.left; leftMargin: parent.radius
                        right: parent.right; rightMargin: parent.radius
                        top: parent.top; topMargin: 1}
                height: 1
                color: "#939393"
            }
        }

    }

    SysText{
        id: text
        text: "文件(F)"
        anchors.centerIn: parent
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }

    state: mouseArea.pressed ? "press" : mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges {target: effectItem; visible: false }
            PropertyChanges {target: hightlight; visible: true}
        },
        State {
            name: "hover" ;
            PropertyChanges {target: effectItem; visible: true }
            PropertyChanges {target: hightlight; visible: true}
            PropertyChanges {target: button; bodyColorGs1: "#717171"; bodyColorGs2: "#606060" }
        },
        State {
            name: "press" ;
            PropertyChanges {target: effectItem; visible: true }
            PropertyChanges {target: hightlight; visible: false}
            PropertyChanges {target: button; bodyColorGs1: "#393939"; bodyColorGs2: "#393939" }
        }
    ]
}
