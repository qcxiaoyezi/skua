import QtQuick 2.2
import "../text"
import "../button"
//import "../addressbar"
//import "../menubar"


Item{
    id: titleBar
    anchors{top: parent.top; left: parent.left; right: parent.right}
    height: 32;

    property int radius: 5

    /*装饰用的灰色线条*/
    Item{
        width: parent.width; height: 4
        clip: true
        Rectangle{
            anchors.fill: parent
            anchors.bottomMargin: -radius;
            width: parent.width
            radius: titleBar.radius
            color: "transparent"
            border{width: 1; color: "#656565"}
        }
    }

    /*图标*/
    Image{
        id: logo
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:///image/logo.png"
        x: 3
    }
    /*标题*/
    SysText{
        id: title
        anchors.verticalCenter: parent.verticalCenter
        anchors{left: logo.right; leftMargin: 3}

        text: "Skua 1.1"
        font.pixelSize: 16
        font.bold: true
        font.weight: Font.Black
        style: Text.Outline
    }


    Button{
        x: 120
        anchors.verticalCenter: parent.verticalCenter
    }


    Button{
        x: 175
        text: "编辑(E)"
        anchors.verticalCenter: parent.verticalCenter
    }

    Button{
        x: 240
        text: "调试(D)"
        anchors.verticalCenter: parent.verticalCenter
    }



//    /*标题*/
//    Text{
//        id: title
//        anchors{top: logo.top; topMargin: -4; left: logo.right; leftMargin: 10}
//        text: "360那啥浏览器 6.1"
//        font.family: "微软雅黑"
//        font.pixelSize: 12
//        color: "#5a5e65"
//    }
//    /*一组按钮*/
//    Row{
//        id: btnsRow
//        anchors{left: logo.right; leftMargin: 10; bottom: logo.bottom}
//        spacing: 6
//        PushButton{
//            image.source: "qrc:///images/return.png"
//        }
//        PushButton{
//            image.source: "qrc:///images/refresh.png"
//        }
//        PushButton{a
//            image.source: "qrc:///images/home.png"
//        }
//        PushButton{
//            image.source: "qrc:///images/star.png"
//        }
//    }
//    /*地址栏*/
//    AddressBar{
//        id: addressbar
//        anchors{left: btnsRow.right; leftMargin: 6; bottom: logo.bottom; right: parent.right; rightMargin: 10}
//    }
    /*系统按钮*/
    SysBtn{
        id: sysBtn
        anchors{rightMargin:7}
        onShowMinimized: mainWindow.showMinimized();
        onShowMaximized: mainWindow.showMaximized();
        onShowNormal: mainWindow.showNormal();
        onClose: mainWindow.close();
    }
//    /*菜单栏*/
//    MenuBar{
//        anchors{top: parent.top; right: sysBtn.left; rightMargin:5}
//    }

}
