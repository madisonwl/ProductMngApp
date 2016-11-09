import QtQuick 2.5

Rectangle {
    id: imgButton;
    implicitWidth: 100;
    implicitHeight: 100;
    color: "red";
    property alias iconSource: appicon.source;
    property alias iconWidth: appicon.width;
    property alias iconheight: appicon.height;
    property alias textColor: btntext.color;
    property alias text: btntext.text;
    property alias font: btntext.font;
  //  radius: 6;  //圆角
    property bool hovered: false;
    property bool focused: false;
    border.color: "#949494";
    border.width: (hovered && focused) ? 2:0;
    antialiasing: true;    //消除锯齿，动态是产生锯齿
    signal clicked;

    transform: [
        Rotation{
            id:rotationTransform;
            angle: 0;
            axis.x:0;
            axis.y:0;
            axis.z:0;

            origin.x: imgButton.width/2.0;
            origin.y: imgButton.height/2.0;

            Behavior on angle {
                NumberAnimation{
                    duration: 100;
                }
            }
        },

        Scale{
            id:scaleTransform;
            xScale: 1;
            yScale: 1;

            origin.x: imgButton.width /2.0;
            origin.y: imgButton.height / 2.0;

            Behavior on xScale {
                NumberAnimation {
                    duration: 100;
                }
            }
            Behavior on yScale {
                NumberAnimation {
                    duration: 100;
                }
            }
        }

    ]

    //图片
    Image {
        id: appicon;
        width:64;
        height:64
        fillMode: Image.PreserveAspectFit;
        //anchors.left: parent.left; //图片在按钮的左侧
        //anchors.verticalCenter: parent.verticalCenter; //上下居中
        anchors.centerIn: parent;
    }

    //文字
    Text{
        id:btntext;
       // anchors.left: appicon.right; //在图片右侧
        //anchors.verticalCenter: appicon.verticalCenter;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin:  4;
        anchors.margins: 4;
        font.pointSize: 10;
        color:(imgBtnMouseArea.pressed && focused ) ? "blue" : (/*parent.hovered ?"#0000a0" :*/ "white");
    }

    MouseArea{
        id:imgBtnMouseArea;
        hoverEnabled: true;
        anchors.fill: parent;
        property bool down: false;

        onPressed: {
            down = true;
            imgButton.hovered = false;
            if(focused==true){
                rotationTransform.axis.x = 0;
                rotationTransform.axis.y = 0;
                rotationTransform.origin.x = imgButton.width / 2.0
                rotationTransform.origin.y = imgButton.height / 2.0

                if (mouseX > parent.width - 50)
                {
                    rotationTransform.origin.x = 0;
                    rotationTransform.axis.y = 1;
                    rotationTransform.angle = 15;
                    return;
                }

                if (mouseX < 50) {
                    rotationTransform.origin.x = imgButton.width;
                    rotationTransform.axis.y = 1;
                    rotationTransform.angle = -15;
                    return;
                }

                if (mouseY < 30) {
                    rotationTransform.origin.y = imgButton.height;
                    rotationTransform.axis.x = 1;
                    rotationTransform.angle = 15;
                    return;
                }

                if (mouseY > parent.height - 30) {
                    rotationTransform.origin.y = 0;
                    rotationTransform.axis.x = 1;
                    rotationTransform.angle = -15;
                    return;
                }

                scaleTransform.xScale = 0.95;
                scaleTransform.yScale = 0.95;
            }
        }
        onEntered: {
            imgButton.hovered = true;
        }

        onReleased: {
            reset();
            if(down){
                imgButton.hovered = true;
                imgButton.clicked();
            }
        }
        onCanceled: {
            imgButton.hovered = false;
            reset();
            down = false;
        }

        onExited: {
            imgButton.hovered = false;
            reset();
            down = false;
        }
        function reset(){
            if(focused==true){
                scaleTransform.xScale = 1;
                scaleTransform.yScale = 1;
                rotationTransform.angle = 0;
            }
        }

    }
}
