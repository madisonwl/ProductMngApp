import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1000;
    height: 600;
    title: qsTr("生产线监控软件");
    color: "blue";


    Splash{}  //启动画面
    Text {
        id: testButton;
        text: qsTr("text");
    }

    ImageButton{
        id:buttonTest;
        anchors.centerIn: parent;
        width: 200;
        height: 100;
        iconSource:"icons/ic_search.png";
        border.color: "#0075f0";
        text: "测试";

        onClicked: {

        }
    }

}
