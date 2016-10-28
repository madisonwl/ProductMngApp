import QtQuick 2.5

Rectangle {
    id: imgButton;
    implicitWidth: 180;
    implicitHeight: 100;

    //图片
    Image {
        id: appicon;
        anchors.left: parent.left; //图片在按钮的左侧
        anchors.verticalCenter: parent.verticalCenter; //上下居中
    }

    //文字
    Text{
        id:btntext;
        anchors.left: appicon.right; //在图片右侧
        anchors.verticalCenter: appicon.verticalCenter;
        anchors.margins: 4;
        color:imgBtnMouseArea.pressed ? "blue" : (parent.hovered ?"#0000a0" : "white");
    }

    MouseArea{
        id:imgBtnMouseArea;
        hoverEnabled: true;

        property bool down: false;

        onPressed: {
            down = true;

            rotationTransform.axis.x = 0;
            rotationTransform.axis.y = 0;
            rotationTransform.origin.x = root.width / 2.0
            rotationTransform.origin.y = root.height / 2.0

            if (mouseX > parent.width - 50)
            {
                rotationTransform.origin.x = 0;
                rotationTransform.axis.y = 1;
                rotationTransform.angle = 15;
                return;
            }

            if (mouseX < 50) {
                rotationTransform.origin.x = root.width;
                rotationTransform.axis.y = 1;
                rotationTransform.angle = -15;
                return;
            }

            if (mouseY < 30) {
                rotationTransform.origin.y = root.height;
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
        onEntered: {
            imgButton.hovered = true;
        }

        onReleased: {
            reset();
            if(down){
                imgButton.clicked();
            }
        }
        onCanceled: {
            reset();
            down = false;
        }

        onExited: {
            reset();
            down = false;
        }
        function reset(){
            scaleTransform.xScale = 1;
            scaleTransform.yScale = 1;
            rotationTransform.angle = 0;
        }

    }
}
