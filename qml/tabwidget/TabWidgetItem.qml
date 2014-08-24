import QtQuick 2.0
import "../text"

Item {
    id: tabWidgetItem
    width: 100; height: 64

    property int itemWidth: 80
    property int headOffset: 0

    property color borderColor: "#282828"
    property color bodyColorGS1: "#535353"
    property color bodyColorGS2: "#535353"
    property color shadeLineColor: "#6a6a6a"

    property alias text: text.text
    default property alias content : body.children


    Rectangle{
        anchors.bottom: head.bottom;
        width: parent.width; height: 1;
        color: borderColor;
    }

    Rectangle{
        id: head
        x: headOffset
        width: itemWidth; height: 20
        border{width: 1; color: tabWidget.borderColor}
        gradient: Gradient {
            GradientStop {position: 0.0; color: bodyColorGS1 }
            GradientStop {position: 1.0; color: bodyColorGS2 }
        }
        Rectangle{
            anchors{top: parent.top; left: parent.left; right: parent.right; margins: 1}
            height: 1;
            color:shadeLineColor
        }
        Rectangle{
            anchors{bottom: parent.bottom;}
            x: 1
            width: parent.width-2; height: 1;
            color:bodyColorGS2
        }

        MouseArea{
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                tabWidget.activeItem = tabWidgetItem;
            }

            SysText{
                id: text
                anchors{left: parent.left; leftMargin: 10;}
            }
        }
    }

    Rectangle{
        id: body
        anchors.fill: parent;
        anchors.margins: 3
        anchors.topMargin: head.height + 3
        color: "#535353"
    }

    state: (tabWidget.activeItem===tabWidgetItem) ? "active" : mouseArea.containsMouse ? "hover" : "normal"
    states: [
        State {
            name: "normal" ;
            PropertyChanges {target: tabWidgetItem;  z:0 ;}
            PropertyChanges {target: tabWidgetItem;  borderColor: "#282828" ;
            bodyColorGS1: "#3c3c3c"; bodyColorGS2: "#363636"; shadeLineColor: "#4a4a4a";}
        },
        State {
            name: "hover" ;
            PropertyChanges {target: tabWidgetItem;  z:0 ;}
            PropertyChanges {target: tabWidgetItem;  borderColor: "#282828" ;
            bodyColorGS1: "#454545"; bodyColorGS2: "#454545"; shadeLineColor: "#595959";}
        },
        State {
            name: "active" ;
            PropertyChanges {target: tabWidgetItem;  z:1 ;}
            PropertyChanges {target: tabWidgetItem;  borderColor: "#282828" ;
            bodyColorGS1: "#535353"; bodyColorGS2: "#535353"; shadeLineColor: "#6a6a6a";}
        }
    ]
}
