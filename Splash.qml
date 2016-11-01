import QtQuick 2.5
import QtGraphicalEffects 1.0

Rectangle {
    id:appslpash;
    anchors.fill: parent;
    color:"black";   //透明

    Text{
        id:title;
        text: "欢迎使用DYX生产线软件监控系统"
        anchors.fill: parent;
        visible: false;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;

        font.pointSize: 46;   //字体大小
        font.family: "Arial"; //字体

        color: "white";       //字体颜色
    }
    FastBlur{
        id:blur;
        anchors.fill: parent;
        source: title;
        radius: 100;
        transform: [
        Scale {
                id: scale;
                origin.x: parent.width / 2;
                origin.y: parent.height / 2;
                xScale: 0.2;
                yScale: 0.2;
            }
        ]
    }
    ParallelAnimation{  //并行组合动画
        id:parallAnim;

        NumberAnimation{
            target: blur;
            property: "radius";
            to:0;
            duration: 800;
            easing.type: Easing.InOutQuad;
        }
        NumberAnimation{
            target: scale;
            property:"xScale";
            to:1;
            duration: 1000;
            easing.type: Easing.OutQuad;
        }
        NumberAnimation{
            target: scale;
            property:"yScale";
            to:1;
            duration: 1000;
            easing.type: Easing.OutQuad;
        }
        NumberAnimation{
            target: blur;
            property: "opacity";
            from:0
            to:1;
            duration:500;
        }

        SequentialAnimation{

            PauseAnimation {
                duration: 1200;
            }

            NumberAnimation {
                target: blur;
                property: "opacity";
                to:0;
                duration: 500
            }
            ScriptAction{
                script: {
                    appslpash.destroy();
                }
            }
        }

    }
    Component.onCompleted: {
        parallAnim.start();
    }

}
