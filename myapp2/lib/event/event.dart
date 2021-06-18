import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("event"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("origin point event"),
              onPressed: () {
                Navigator.pushNamed(context, "origin_point_event");
              },
            ),
            TextButton(
              child: Text("gesture recognize"),
              onPressed: () {
                Navigator.pushNamed(context, "gesture_recognize");
              },
            ),
            TextButton(
              child: Text("notification"),
              onPressed: () {
                Navigator.pushNamed(context, "notification");
              },
            )
          ],
        ),
      ),
    );
  }
}
