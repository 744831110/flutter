import 'package:flutter/material.dart';

class PointerEventWidget extends StatefulWidget {
  PointerEventWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return PointerEventWidgetState();
  }
}

class PointerEventWidgetState extends State<PointerEventWidget> {
  PointerEvent pointerEvent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Listener(
            child: Container( 
              height: 100,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(pointerEvent.toString() ?? "", style: TextStyle(color: Colors.white),),
            ),
            onPointerUp: (event) => setState(() => pointerEvent = event),
            onPointerDown: (event) => setState(() => pointerEvent = event),
            onPointerMove: (event) => setState(() => pointerEvent = event),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 150.0)),
              child: Center(child: Text("Box A")),
            ),
            behavior: HitTestBehavior.opaque,
            onPointerDown: (event) => print("down A")
          ),
          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blue)
                  ),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                ),
                onPointerDown: (event) => print("down1"),
                behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
              )
            ],
          ),
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event)=>print("in"),
              ),
            ),
            onPointerDown: (event)=>print("up"),
          )
        ],
      )
    );
  }
}