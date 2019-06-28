import 'package:flutter/material.dart';

class FlowLayoutWidget extends StatefulWidget {

  FlowLayoutWidget({Key key, this.title}):super(key: key);

  final String title;

@override
  State<StatefulWidget> createState() {
    return FlowLayoutWidgetState();
  }
}

class FlowLayoutWidgetState extends State<FlowLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text(widget.title),),
      body: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Text("this is text"*20)
            ],
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 4.0,
            alignment: WrapAlignment.start,
            children: <Widget>[
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Hamilton'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Lafayette'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Mulligan'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Laurens'),
              ),
              Flow(
                children: <Widget>[
                  new Container(width: 80.0, height:80.0, color: Colors.red,),
                  new Container(width: 80.0, height:80.0, color: Colors.green,),
                  new Container(width: 80.0, height:80.0, color: Colors.yellow,),
                  new Container(width: 80.0, height:80.0, color: Colors.blue,),
                  new Container(width: 80.0, height:80.0, color: Colors.purple,),
                  new Container(width: 80.0, height:80.0, color: Colors.black,),
                ],
                delegate: FlowLayoutFlowDelegate(margin: EdgeInsets.all(10)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FlowLayoutFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  FlowLayoutFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}