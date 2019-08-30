import 'package:flutter/material.dart';
import 'dart:async';

class TimerWidget extends StatefulWidget {
  TimerWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return TimerWidgetState();
  }
}

class TimerWidgetState extends State<TimerWidget> {
  int minute = 10;
  int second = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (second == 0) {
          if (minute == 0) {
            timer.cancel();
          }
          minute--;
          second = 59;
        } else {
          second--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text("$minute : $second")),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    timer = null;
    super.dispose();
  }
}
