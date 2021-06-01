import 'package:flutter/material.dart';

class BaseComponentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("base component"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text(
                "状态管理",
              ),
              onPressed: () => Navigator.pushNamed(context, "state_manager"),
            ),
            TextButton(
              child: Text(
                "text",
              ),
              onPressed: () => Navigator.pushNamed(context, "text"),
            ),
            TextButton(
              child: Text(
                "button",
              ),
              onPressed: () => Navigator.pushNamed(context, "button"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "image"),
              child: Text(
                "image",
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, "switch_and_checkbox"),
              child: Text("switch and checkbox"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "input"),
              child: Text("input"),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "indicator"),
              child: Text("indicator"),
            )
          ],
        ),
      ),
    );
  }
}
