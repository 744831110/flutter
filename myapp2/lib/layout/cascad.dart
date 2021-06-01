import 'package:flutter/material.dart';

class CascadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cascad"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Text(
                "hello world",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("i am jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("your friend"),
            )
          ],
        ),
      ),
    );
  }
}
