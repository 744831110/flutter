import 'package:flutter/material.dart';

class OriginPointEventWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OriginPointEventWidgetState();
  }
}

class OriginPointEventWidgetState extends State<OriginPointEventWidget> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("origin point event"),
      ),
      body: Center(
          child: Column(
        children: [
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Text(
                _event.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPointerDown: (PointerDownEvent event) {
              setState(() {
                _event = event;
              });
            },
            onPointerMove: (PointerMoveEvent event) {
              setState(() {
                _event = event;
              });
            },
            onPointerUp: (PointerUpEvent event) {
              setState(() {
                _event = event;
              });
            },
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 150.0)),
              child: Center(
                child: Text("Box A"),
              ),
            ),
            behavior: HitTestBehavior.opaque,
            onPointerDown: (event) => print("down A"),
          ),
          Container(
            constraints: BoxConstraints.tight(Size(300.0, 200.0)),
            child: Stack(
              children: [
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: Center(
                      //点击透明区域可以穿透事件
                      child: Text("点击"),
                    ),
                  ),
                  onPointerDown: (event) => print("down1"),
                  behavior: HitTestBehavior.translucent,
                ),
              ],
            ),
          ),
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 50.0,
                ),
                onPointerDown: (event) => print("in"),
              ),
            ),
            onPointerDown: (event) => print("up"),
          )
        ],
      )),
    );
  }
}
