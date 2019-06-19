import 'package:flutter/material.dart';

class PictureAndIconWidget extends StatefulWidget {
  PictureAndIconWidget({Key key,this.title}): super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return PictureAndIconWidgetState();
  }
}

class PictureAndIconWidgetState extends State<PictureAndIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}