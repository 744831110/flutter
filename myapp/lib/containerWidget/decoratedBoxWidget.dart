import 'package:flutter/material.dart';

class DecoratedBoxWidget extends StatefulWidget {
  DecoratedBoxWidget({Key key, this.title}):super(key: key);
  
  final String title;

  @override
  State<StatefulWidget> createState() {
    return DecoratedBoxWidgetState();
  }
}

class DecoratedBoxWidgetState extends State<DecoratedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [BoxShadow(color: Colors.black, offset: Offset(2.0, 2.0), blurRadius: 4.0)]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
            child: Text("login", style: TextStyle(color: Colors.white),),
          ),
        )
      ),
    );
  }
}