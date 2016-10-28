import QtQuick 2.5
import QtGraphicalEffects 1.0

Rectangle {
    id:slpash;
    anchors.fill: parent;
    color:"transparent";   //透明

    Text{
        id:title;
        text: "欢迎使用DYX生产线软件监控系统"
        anchors.fill: parent;
        visible: fasle;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;

        font.pointSize: 46;   //字体大小
        font.family: "Arial"; //字体

        color: "white";  //字体颜色
    }
    FastBlur{
        id:blur;
        anchors.fill: parent;

    }

}
