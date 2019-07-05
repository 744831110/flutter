import 'package:flutter/material.dart';

class PaddingWidget extends StatefulWidget {
  PaddingWidget({Key key, this.title}): super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return PaddingWidgetState();
  }
}

class PaddingWidgetState extends State<PaddingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(widget.title),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("the center")
              ,
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text("hello world"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 90.0),
                child: Text("i am jack"),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 300, 30, 20),
                child: Text("your friend"),
              )
            ],
          ),
        ),
      ),
    );
  }
}