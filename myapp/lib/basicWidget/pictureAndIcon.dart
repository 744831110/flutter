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
            Image.asset("lib/images/icon2.jpg", width: 100),
            Image.network("https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action@1.0/docs/imgs/image-20180829163427556.png", width: 100),
          ],
        ),
      ),
    );
  }
}