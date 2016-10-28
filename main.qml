import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("生产线监控软件")
    color:"blue";

    MouseArea {
        anchors.fill: parent
        //onClicked: {
          //  Qt.quit();
       // }
    }

    Splash{}
    Text {
        //text: qsTr("Hello World")
        anchors.centerIn: parent
    }
}
