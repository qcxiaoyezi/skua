import QtQuick 2.2
import "../tabwidget"

WindowFrame{
    id: mainWindow
    width: 1000; height: 600;
    minSize: Qt.size(600,400)
    dragHieght: titleBar.height

    TitleBar{
        id: titleBar
        anchors{top: parent.top; left: parent.left; right: parent.right}
        anchors.margins: 1
    }

    /*body*/
    Rectangle{
        id: body
        anchors{top: titleBar.bottom; bottom: parent.bottom; bottomMargin: 5
            left: parent.left; leftMargin: 5; right: parent.right; rightMargin: 5;}
        color: "#404040"
//        color: "#3a3a3a"
        border{width: 1; color:"#282828" }
        /* shade line*/
//        Rectangle{
//            anchors{top: parent.top; left: parent.left; right: parent.right}
//            anchors.margins: 1
//            height: 1;
//            color:"#656565"
//        }

        TabWidget{
            anchors{top: parent.top; bottom: parent.bottom;
                left: parent.left;}


        }



    }






}
