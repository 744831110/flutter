import 'package:flutter/gestures.dart';
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
  // 缩放
  double imageWidth = 200.0;
  // gestureRecognizer
  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();
  bool flag = false;

  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }
  
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
                maxHeight: 80.0
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
                        onHorizontalDragUpdate: (DragUpdateDetails e){
                          setState(() {
                            final result = left + e.delta.dx;
                            if (result < 15 || result > MediaQuery.of(context).size.width - 55){
                              return;
                            }
                            left = result;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Image.asset("lib/images/pic2.jpg", width: imageWidth),
              onScaleUpdate: (ScaleUpdateDetails e){
                setState(() {
                  print("scaleUpdate");
                  imageWidth=200*e.scale.clamp(.8, 10.0);
                  print(imageWidth);
                });
              },
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "你好世界",style: TextStyle(fontSize: 30)),
                  TextSpan(text: "点我变色", 
                  style: TextStyle(fontSize: 40, color: flag ? Colors.blue : Colors.red),
                  recognizer: tapGestureRecognizer
                    ..onTap = (){
                      setState(() {
                        flag = !flag;
                      });
                    }
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}