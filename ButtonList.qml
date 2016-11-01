import QtQuick 2.5

Rectangle {
    id:buttonsList;
    width: 500;
    height: 200;
    color: "transparent"; //透明

    Grid{
        anchors.centerIn: parent;
//        anchors.left: parent.left;
//        anchors.leftMargin: 4;
//        anchors.bottom: parent.bottom;
//        anchors.bottomMargin: 4;
        rows:3;
        columns: 4;
        rowSpacing:10;
        columnSpacing: 10;

        ImageButton{  //1-s
            id:buttonTest1;
            width: 150;
            height: 150;
            iconSource:"icons/display.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "主监控";

            onClicked: {
                loader.source = "ProcessXmlMng.qml";
                //loader.source = "ProcessXmlMng.qml";
                loadingAction.start();
            }
        }
        ImageButton{
            id:buttonTest2;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "工艺管理";
        }

        ImageButton{
            id:buttonTest3;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "产品管理";
        }

        ImageButton{
            id:buttonTest4;
            width: 150;
            height: 150;
            iconSource:"icons/file-doc.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "订单管理";
        }

        ImageButton{
            id:buttonTest5;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "设备监控";
        }

        ImageButton{
            id:buttonTest6;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "程序传输";
        }

        ImageButton{
            id:buttonTest7;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "设备配置";
        }

        ImageButton{
            id:buttonTest8;
            width: 150;
            height: 150;
            iconSource:"icons/syssetup.png";
            border.color: "#0075f0";
           // color:"#0075f0";
            color:"#D9522C";
            text: "系统设置";
        }
    }
    Loader {
        id: loader

        anchors.fill: parent

        SequentialAnimation {
            id: loadingAction;
            PauseAnimation { duration: 300 }
            ScriptAction {
                script: {
                    //loader.source = "ProcessXmlMng.qml";
                }
            }
        }
    }
 }
