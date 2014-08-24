import QtQuick 2.2
import QtQml 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.0

import "../mousearea"

ApplicationWindow{
    id: appWindow
    width: 800;height: 480;
    visible: true
    color: "transparent"
    flags:   Qt.FramelessWindowHint
           | Qt.WindowSystemMenuHint
           | Qt.WindowMinimizeButtonHint
           | Qt.Window

    default property alias content : frame.children
    property alias minSize: resizeArea.minSize
    property alias dragHieght: resizeArea.dragHeight

    property int radius: 5
    property color borderColor: "#0f0f0f"
    property color bodyColor: "#535353"

    /*resize area 的范围是比可见的主窗口还要大的*/
    ResizeArea{
        id:resizeArea
        anchors.fill: parent
        anchors.margins: 12          /*给外边框阴影余留了一定的空间*/
        target: appWindow
        minSize: Qt.size(600,400)
        enabled: true

        /*这个是外边框阴影.*/
        RectangularGlow {
            id: outGlow
            anchors.fill: frame
            anchors.margins: 0
            anchors.bottomMargin: 0   /*底部阴影没有缩进因此底部阴影颜色最浓*/
            glowRadius: 8
            spread: 0.1
            color: "#000000"
            cornerRadius: frame.radius + glowRadius
        }
        /*这个是外边框*/
        Rectangle{
            id: frame
            anchors.fill: parent
            color: appWindow.bodyColor
            border{width: 1; color: appWindow.borderColor}
            radius: appWindow.radius
        }
    }

    Item{
        /*visibility 这个变量描述着当前的窗口的显示状态. */
        state:appWindow.visibility
        states: [
            State {
                name: "2"/*QWindow::Windowed*/
                PropertyChanges { target: resizeArea; anchors.margins: 12; enabled: true }
                PropertyChanges { target: outGlow; visible: true}
                PropertyChanges { target: frame;  border.width: 1;}
            },
            State {
                name: "4"/*"Qt.FullScreen"*/
                PropertyChanges { target: resizeArea; anchors.margins: 0; enabled: false }
                PropertyChanges { target: outGlow; visible: false }
                PropertyChanges { target: frame;  border.width: 0;}
            }
        ]
    }
}
