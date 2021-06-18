import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("custom widget"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("combination widget"),
              onPressed: () {
                Navigator.pushNamed(context, "combination_widget");
              },
            ),
            TextButton(
              child: Text("custom_painter"),
              onPressed: () {
                Navigator.pushNamed(context, "custom_painter");
              },
            ),
            TextButton(
              child: Text("circle_progress"),
              onPressed: () {
                Navigator.pushNamed(context, "circle_progress");
              },
            )
          ],
        ),
      ),
    );
  }
}
