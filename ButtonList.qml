import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id:buttonsList;
    width: 800;
    height: 480;
    color: "transparent"; //透明
    property bool focused: true;

    property Component processXmlMngComponent: null;
    property var processXmlMngWindow: null;
    function showProcessXmlMng(){
        if(processXmlMngComponent == null){
            processXmlMngComponent = Qt.createComponent("ProcessXmlMng.qml");
        }
        if(processXmlMngWindow == null /*&& processXmlMngComponent.status == processXmlMngComponent.Ready*/){
            processXmlMngWindow = processXmlMngComponent.createObject(
                        buttonsList,
                        {
                            "width": 800, "height": 500,
                            "x": (Screen.width - 800)/2,

                            "y": (Screen.height - 500)/2
                        }
                        );
            processXmlMngWindow.canceled.connect(onProcessXmlMngCanceled);
        }
    }

    function onProcessXmlMngCanceled(){
        processXmlMngWindow.destroy();
        processXmlMngWindow = null;
        buttonsList.focused = true;
        update();
    }

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
            focused: buttonsList.focused;

            onClicked: {
//                loader.source = "ProcessXmlMng.qml";
//                //loader.source = "ProcessXmlMng.qml";
//                loadingAction.start();
                buttonsList.showProcessXmlMng();
                buttonsList.focused = false;

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
            focused: buttonsList.focused;
        }

        ImageButton{
            id:buttonTest3;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "产品管理";
            focused: buttonsList.focused;
        }

        ImageButton{
            id:buttonTest4;
            width: 150;
            height: 150;
            iconSource:"icons/file-doc.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "订单管理";
            focused: buttonsList.focused;
        }

        ImageButton{
            id:buttonTest5;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "设备监控";
            focused: buttonsList.focused;
        }

        ImageButton{
            id:buttonTest6;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "程序传输";
            focused: buttonsList.focused;
        }

        ImageButton{
            id:buttonTest7;
            width: 150;
            height: 150;
            iconSource:"icons/ic_search.png";
            border.color: "#0075f0";
            color:"#0075f0";
            text: "设备配置";
            focused: buttonsList.focused;
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
            focused: buttonsList.focused;
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
