import QtQuick 2.2
import QtGraphicalEffects 1.0
import "./sysbtn"

Item{
    id: sysBtns
    anchors{top: parent.top; right: parent.right}
    width: 110; height: 22;

    property int radius : 3
    property color borderColor: "#303030"

    signal showMinimized;
    signal showMaximized;
    signal showFullScreen;
    signal showNormal;
    signal close;

    /*border in normal state*/
    Item{
        anchors.fill: parent;
        clip: true
        Rectangle{
            anchors.fill: parent
            anchors.topMargin: sysBtns.radius
            radius: sysBtns.radius;
            color: "#737373"
        }
        Rectangle{
            anchors.fill: parent
            anchors{topMargin: -radius;bottomMargin: 1}
            radius: sysBtns.radius
            border{width: 1; color: borderColor}
            color: "#3d3d3d"
        }
    }
    Rectangle{
        id: borderOne
        x: 30
        anchors{top:parent.top; bottom: parent.bottom; bottomMargin: 1 }
        color: borderColor
        width: 1
    }
    Rectangle{
        id: borderTwo
        x: 60
        anchors{top:parent.top; bottom: parent.bottom; bottomMargin: 1 }
        color: borderColor
        width: 1
    }

    /*buttons*/
    SysSubBtn{
        id:minBtn
        anchors{left: parent.left; leftMargin: 1; right: borderOne.left;
                top: parent.top; bottom: parent.bottom;bottomMargin: 2}
        radius: sysBtns.radius
        body.anchors{rightMargin: -radius}
        image.source: "qrc:///image/minBtn.png"
        mouseArea.onClicked: showMinimized();
    }
    SysSubBtn{
        id:maxBtn
        anchors{left: borderOne.right; right: borderTwo.left;
                top: parent.top; bottom: parent.bottom;bottomMargin: 2}
        body.anchors{rightMargin: 0}
        body.anchors{bottomMargin: -radius}

        image.source: "qrc:///image/maxBtn.png"
        property bool isMax: false
        mouseArea.onClicked:{
            if(false === isMax){
                isMax = true;
                image.source = "qrc:///image/multipleBtn.png";
                showMaximized();
            }else{
                isMax = false;
                image.source = "qrc:///image/maxBtn.png";
                showNormal();
            }
        }
    }
    SysSubBtn{
        id:closeBtn
        anchors{left: borderTwo.right; right: parent.right; rightMargin: 1
                top: parent.top; bottom: parent.bottom;bottomMargin: 2}
        body.anchors{leftMargin: -radius}
        radius: sysBtns.radius

        image.source: "qrc:///image/closeBtn.png"
        mouseArea.onClicked: close();
    }

}
