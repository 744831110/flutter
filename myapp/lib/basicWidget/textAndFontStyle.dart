import 'package:flutter/material.dart';

class TextAndFontStyleWidget extends StatefulWidget {
  TextAndFontStyleWidget({Key key, this.title}): super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return TextAndFontStyleWidgetState();
  }
}

class TextAndFontStyleWidgetState extends State<TextAndFontStyleWidget> {
  void pushToMaterialPageRoute(Widget route){
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return route;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "hello world", 
              textAlign: TextAlign.center,
              ),
            Text(
              "hello world"*10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "helloworld",
              textScaleFactor: 1.5,
            ),
            Text(
              "text style",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed 
              ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: "home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue
                  )
                )
              ]
            )),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.red,
                fontSize: 20
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am jack"),
                  Text("I am Jack",
                    style: TextStyle(
                      inherit: false,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}