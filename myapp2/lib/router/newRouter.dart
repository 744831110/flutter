import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  NewRoute({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new router"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("accpet text value is $text"),
            TextButton(
              child: Text("pop"),
              onPressed: () => Navigator.pop(context, "返回值"),
            )
          ],
        ),
      ),
    );
  }
}
