import QtQuick 2.0
import "../text"

Item{
    id: tabWidget

    width: 250; height: 500;
    property color borderColor: "#282828"
    property var activeItem : itemOne

    /*背景*/
    Rectangle{
        anchors.fill: parent;
        color: "#535353"
        border{width: 1; color: tabWidget.borderColor}
    }
    /*tab 标签栏 背景*/
    Rectangle{
        width: parent.width;
        height: 20
        border{width: 1; color: tabWidget.borderColor}
        gradient: Gradient {
            GradientStop {position: 0.0; color: "#3b3b3b" }
            GradientStop {position: 1.0; color: "#363636" }
        }
        Rectangle{
            anchors{top: parent.top; left: parent.left; right: parent.right}
            anchors.margins: 1
            height: 1;
            color:"#4a4a4a"
        }
    }

    Item{
        anchors.fill: parent

        TabWidgetItem{
            id: itemOne
            anchors.fill: parent;
            text: "媒体信息"

            Rectangle{
                anchors.fill: parent
                color: "#303030"
                border{width: 1; color: "#1e1e1e"}
                clip: true
                Rectangle{
                    anchors.fill: parent;
                    anchors.rightMargin: -2;
                    anchors.bottomMargin: -2;
                    color: "transparent"
                    border{width: 1; color: "#0d0d0d"}
                }
                Rectangle{
                    anchors.fill: parent;
                    anchors.topMargin: 1
                    anchors.leftMargin: 1
                    anchors.rightMargin: -2;
                    anchors.bottomMargin: -2;
                    color: "transparent"
                    border{width: 1; color: "#272727"}

                    Column{
                        width: parent.width
                        Repeater{
                            model: ["文件名:   XXX.XXX","分辨率:   1920*1080","码   率:   15265kpbs","时   长:   120分钟"   ]
                            delegate: Item{
                               anchors{left: parent.left; leftMargin: 5; right: parent.right; rightMargin: 5 }
                               height: 25
                               SysText{
                                    x: 5
                                    text: modelData;
                                    anchors.verticalCenterOffset: 1
                               }
                               Rectangle{
                                   width: parent.width
                                   height: 1;
                                   anchors.bottom: parent.bottom; anchors.bottomMargin: 1;
                                   color: "#181818"
                               }
                               Rectangle{
                                   width: parent.width
                                   height: 1;
                                   anchors.bottom: parent.bottom;
                                   color: "#484848"
                               }


                            }
                        }
                    }

//                    Item{
//                        width: parent.width;
//                        height: 34;
//                        SysText{
//                            x: 10
//                            text: "文件名:   XXX.XXX"
//                            font.pixelSize: 14
//                        }
//                    }

//                    Item{
//                        y: 25;
//                        width: parent.width;
//                        height: 34;
//                        SysText{
//                            x: 10
//                            text: "分辨率:   1920*1080"
//                            font.pixelSize: 14
//                        }
//                    }




                }

            }
        }

        TabWidgetItem{
            anchors.fill: parent;
            headOffset: 79
            text: "文件列表"
        }

        TabWidgetItem{
            anchors.fill: parent;
            headOffset: 158
            text: "帮助"
        }





    }


}


