import QtQuick 2.5

Rectangle {
    id: processMng;
    width: 640;
    height: 480;

   // anchors.centerIn: parent;

    Text {
        id: show;
        text: qsTr("text");
        anchors.centerIn: parent;
    }
}
