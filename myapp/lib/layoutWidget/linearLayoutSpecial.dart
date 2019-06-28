import 'package:flutter/material.dart';

class LinearLayoutSpecialWidget extends StatelessWidget {
  LinearLayoutSpecialWidget({Key key, this.title}):super(key: key);
  final String title;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: Container(
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,// 有效，外层column为整个屏幕的高度
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,// 无效，内层column为实际高度，如果要让里面的column占满外部column可以使用Expanded widget
                children: <Widget>[
                  Text("hello world"),
                  Text("i am jack")
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}