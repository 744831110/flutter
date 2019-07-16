import 'package:flutter/material.dart';

class GestureRecognizerWidget extends StatefulWidget {
  GestureRecognizerWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return GestureRecognizerWidgetState();
  }
}

class GestureRecognizerWidgetState extends State<GestureRecognizerWidget> {
  // 保存点击，双击，长按操作字符串
  String operation = "NO gesture detected";
  // 拖动，滑动
  double top = 0.0;
  double left = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300,
                height: 100,
                child: Text(operation, style: TextStyle(color: Colors.white),),
              ),
              onTap: () => setState((){ operation = "tap"; }),
              onDoubleTap: () => setState((){ operation = "double tap"; }) ,
              onLongPress: () => setState((){ operation = "long press"; }),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                maxHeight: 150.0
              ),
              child: Container(
                color: Colors.grey,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: top,
                      left: left,
                      child: GestureDetector(
                        child: CircleAvatar(child: Text("A", style: TextStyle(color: Colors.white),),),
                        onPanDown: (DragDownDetails e){
                          print("用户按下的位置为${e.globalPosition}");
                        },
                        onPanUpdate: (DragUpdateDetails e){
                          setState(() {
                            left += e.delta.dx;
                            top += e.delta.dy;
                          });
                        },
                        onPanEnd: (DragEndDetails e){
                          print("手指滑动的速度${e.velocity}");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}