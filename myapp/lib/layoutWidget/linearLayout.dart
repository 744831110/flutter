import 'package:flutter/material.dart';
import 'linearLayoutSpecial.dart';

class LinearLayoutWidget extends StatefulWidget {
  LinearLayoutWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return LinearLayoutWidgetState();
  }
}

class LinearLayoutWidgetState extends State<LinearLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("hello world"),
                Text("i am jack")
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("hello world"),
                Text("i am jack")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text("hello world"),
                Text("i am jack")
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Text("hello world", style: TextStyle(fontSize: 30),),
                Text("i am jack")
              ],
            ),
            FlatButton(
              child: Text("特殊情况"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new LinearLayoutSpecialWidget(title: "线性布局特殊情况",);
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}