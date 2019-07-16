import 'package:flutter/material.dart';
import 'pointerEvent.dart';
import 'gestureRecognizer.dart';

class EventAndNotificationEntranceWidget extends StatefulWidget {
  EventAndNotificationEntranceWidget({Key key, this.title}): super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return EventAndNotificationEnTranceWidgetState();
  }
}

class EventAndNotificationEnTranceWidgetState extends State<EventAndNotificationEntranceWidget> {
  void pushToMaterialPageRoute(Widget route){
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return route;
    }));
  }

  PointerEvent pointerEvent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Pointer事件处理"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new PointerEventWidget(title: "Pointer事件处理",));
              },
            ),
            FlatButton(
              child: Text("手势识别"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new GestureRecognizerWidget(title: "手势识别",));
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}