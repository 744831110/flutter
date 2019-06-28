import 'package:flutter/material.dart';

class CascadeLayoutWidget extends StatefulWidget {

  CascadeLayoutWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return CascadeLayoutWidgetState();
  }
}

class CascadeLayoutWidgetState extends State<CascadeLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("层叠布局"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              child: Text("left text"),
              left: 10,
            ),
            Container(
              child: Text("hello world", style: TextStyle(color: Colors.white),),
              color: Colors.red,
            ),
            Positioned(
              child: Text("top text"),
              top: 18.0,
            )
          ],
        ),
      )
    );
  }
}