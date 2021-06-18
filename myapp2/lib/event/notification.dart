import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationWidgetState();
  }
}

class NotificationWidgetState extends State<NotificationWidget> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notification"),
      ),
      body: Center(
        child: NotificationListener(
          onNotification: (notification) {
            print(notification.runtimeType);
            print(notification);
            return false;
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
                onTap: () {
                  MyNotification("Hi").dispatch(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
