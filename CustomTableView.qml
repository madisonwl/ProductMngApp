/*自定义TableView组件，更改其样式 zhg 14-6-23*/
import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Item{
    anchors.fill: parent
	id:tableRect;
	width:800;
	height:480;
    ListModel{
        id:tableModel
        ListElement{sequence:"1";norm:"指标1";exponent:"98.5"}
        ListElement{sequence:"2";norm:"指标2";exponent:"98.5"}
        ListElement{sequence:"3";norm:"指标3";exponent:"98.5"}
        ListElement{sequence:"4";norm:"指标4";exponent:"98.5"}
        ListElement{sequence:"5";norm:"指标5";exponent:"98.5"}
        ListElement{sequence:"6";norm:"指标6";exponent:"98.5"}
    }

    TableView{
        id:tableView
        anchors.fill: parent
        TableViewColumn{role:"sequence";title: "序号";width:tableRect.width*0.2;
            horizontalAlignment: Text.AlignHCenter
        }

        TableViewColumn{role:"norm";title: "指标";width:tableRect.width*0.4;
            horizontalAlignment: Text.AlignHCenter
        }
        TableViewColumn{role:"exponent";title:"指数";width:tableRect.width*0.4;
            horizontalAlignment: Text.AlignHCenter
        }
        backgroundVisible: false
        alternatingRowColors: false
        frameVisible:false

        style:TableViewStyle{
            transientScrollBars:true
        }

        headerDelegate:Rectangle{
            color: "#161616"
            width: parent.width
            height:50
            border.color: "#585858"
            border.width: 1
            Text {
                text: styleData.value
                anchors.centerIn:parent
                color:"white"
                font.family: "黑体"
                font.pointSize: 14
            }
        }

        itemDelegate: Rectangle {
            width: styleData.width
            height: styleData.height
            color: "transparent"
            border.color: "#585858"
            border.width: 1
            Text {
                color: "white"
                elide: styleData.elideMode
                text: styleData.value
                horizontalAlignment: Text.AlignHCenter
                font.family: "黑体"
                font.pointSize: 14
                anchors.centerIn: parent
            }
        }
        rowDelegate: Rectangle{
            color: styleData.selected ?　"#232323":"transparent"
            width: styleData.width
            height: 40
        }

        model: tableModel
    }
}
