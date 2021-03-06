import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: Screen.width;//1000;
    height: Screen.height;//600;
    title: qsTr("生产线监控软件");
    color: "#002056";
    id:root;


    Splash{}  //启动画面


    ButtonList{
        id:appShow;
        opacity: 0;
        anchors.fill: parent;
        anchors.leftMargin: 400;
    }

    SequentialAnimation{
        running: true;

        PauseAnimation {
            duration: 1300;
        }

        ParallelAnimation{  //模糊度渐变

            NumberAnimation {
                targets: appShow;
                properties: "opacity";
                to:1;
                duration: 600;
                easing.type: Easing.InOutQuad;
            }

            NumberAnimation {   //appShow 界面从右面出来
                target: appShow;
                property: "anchors.leftMargin";
                to: 0;
                duration: 1000;
                easing.type: Easing.OutQuint
            }

            ColorAnimation {
                target: root;
                property: "color";
               // from: "black"
                to: "#002056"
                duration: 1000
              //  easing.type: Easing.OutQuint
            }
        }
    }
    Button{
        id: exitSys;
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin:  4;
        width: 80;
        height: 48;
        style: Qt.createComponent("CommButtonStyle.qml");
        text: qsTr("退出系统");
        onClicked: Qt.quit();

    }

}
