import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: processMng;
    visible: true
    color: "#3399ff";
    signal canceled();
    signal applied();
    title: "工艺管理";

    TableView{
        id:processTable;
        width: parent.width;
        height: parent.height-cancel.height-8;
        x:parent.x;
        y:parent.y;
        //frameVisible:false;
        //backgroundVisible: false
        //alternatingRowColors: false


        style: TableViewStyle{
            id:tablestyle;
            headerDelegate: Rectangle {
                implicitWidth: 10;
                implicitHeight: 34;
                // gradient: styleData.pressed ? root.pressG : (styleData.containsMouse ? root.hoverG: root.normalG);
                border.width: 1;
                border.color: "yellow";
                radius: 4;
                color:"#3399ff";
                Text {
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 4;
                    anchors.right: parent.right;
                    anchors.rightMargin: 4;
                    text: styleData.value;
                    color: styleData.pressed ? "blue" : "white";
                    font.pointSize: 13;
                    font.bold: true;
                }
            }

            itemDelegate: Rectangle{
                width: styleData.width
                height: styleData.height
                color: "transparent"
                border.color: "#585858"
                border.width: 1
                Text {
                    color: "black"
                    text: styleData.value;
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignRight;
                    font.pointSize: 13;
                    elide: styleData.elideMode;

                    font.family: "黑体"

                    anchors.centerIn: parent

                    onTextChanged: {
                        switch(styleData.column){
                        case 2:
                        case 3:
                        case 4:
                            //color = processMng.colorOf(styleData.row);
                            break;
                        }
                    }
                }
            }

            rowDelegate: Rectangle{
                height: 30; // row height
                color: styleData.selected ? "lightsteelblue" :
                  (styleData.alternate ? tablestyle.backgroundColor
                                           : tablestyle.alternateBackgroundColor);
                width: styleData.width;
//                Rectangle{
//                    anchors.top: parent.top;
//                    width: parent.width;
//                    height: 1;
//                    color: "yellow";
//                }
            }

        }

        model: processTableTest;

        TableViewColumn{
            id:checkedColumn;
            role:"checked";
            title: qsTr("选择");
            width: 56;
            movable: false;
            delegate: Rectangle{
                width: styleData.width
                height: styleData.height
                color: "transparent"
                border.color: "#585858"
                border.width: 1
                CheckBox{
                    anchors.centerIn: parent;
                    checked: styleData.value;
                    visible: isCheckColumn( styleData.column )
                }

                Text{
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: styleData.value
                    color: isCheckColumn( styleData.column )? "black": styleData.value
                    visible: !isCheckColumn( styleData.column )
                    font.pointSize: 13;

                }
                function isCheckColumn( columnIndex ){
                    return processTable.getColumn( columnIndex ) === checkedColumn
                }
            }
        }
        TableViewColumn{
            id:cColum1;
            role:"data1";
            title: qsTr("数据项1");
            movable: false;
//            delegate: Text{
//                color: "#551A8B";
//                text: styleData.value;
//                font.pointSize: 13;
//                verticalAlignment: Text.AlignVCenter;
//                horizontalAlignment: Text.AlignLeft;
//            }
        }
        TableViewColumn{
            id:cColum2;
            role:"data2";
            title: qsTr("数据项2");
            movable: false;
//            delegate: Text{
//                color: "#551A8B";
//                text: styleData.value;
//                font.pointSize: 13;
//                verticalAlignment: Text.AlignVCenter;
//                horizontalAlignment: Text.AlignLeft;
//            }
        }
    }
    ListModel{
        id: processTableTest;
        ListElement{
            checked:false;
            data1:"11";
            data2:"22";
        }

        ListElement{
            checked:true;
            data1:"12";
            data2:"24";
        }
    }

    Button {
        id: apply;
        anchors.right: parent.horizontalCenter;
        anchors.rightMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin:  4;
        width: 70;
        height: 28;
        style: Qt.createComponent("CommButtonStyle.qml");
        text: qsTr("应用");
        onClicked: processMng.canceled();
    }

    Button {
        id: cancel;
        anchors.left: parent.horizontalCenter;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin:  4;
        width: 70;
        height: 28;
        style: Qt.createComponent("CommButtonStyle.qml");
        text: qsTr("退出");
        onClicked: processMng.canceled();
    }
}
