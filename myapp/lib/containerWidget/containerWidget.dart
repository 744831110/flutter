import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  ContainerWidget({Key key, this.title}):super(key: key);
  
  final String title;

  @override
  State<StatefulWidget> createState() {
    return ContainerWidgetState();
  }
}

class ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 10),// margin是容器内部的补白，padding是容器外部的补白
          constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98
            ),
            boxShadow: [BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0
            )],
          ),
          transform: Matrix4.rotationZ(.2),
          alignment: Alignment.center,
          child: Text("5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),),
        ),
      ),
    );
  }
}