import 'package:flutter/material.dart';

class SingleChildScrollViewWidget extends StatefulWidget {
  SingleChildScrollViewWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return SingleChildScrollViewWidgetState();
  }
}

class SingleChildScrollViewWidgetState extends State<SingleChildScrollViewWidget> {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Scrollbar(
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: str.split("").map((c) => Text(c, textScaleFactor: 3,)).toList()
            ),
          ),
        ),
      ),
    );
  }
}