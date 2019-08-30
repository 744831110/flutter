import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/other/timerWidget.dart';

class OtherEntranceWidget extends StatefulWidget {
  OtherEntranceWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return OtherEntranceWidgetState();
  }
}

class OtherEntranceWidgetState extends State<OtherEntranceWidget> {
  void pushToMaterialPageRoute(Widget route) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return route;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("倒计时"),
              textColor: Colors.blue,
              onPressed: () {
                pushToMaterialPageRoute(TimerWidget(
                  title: "倒计时",
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
