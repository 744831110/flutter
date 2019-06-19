import 'package:flutter/material.dart';
import 'package:myapp/basicWidget/button.dart';
import 'package:myapp/basicWidget/widgetIntroduce.dart';
import 'widgetIntroduce.dart';
import 'textAndFontStyle.dart';
import 'button.dart';
import 'pictureAndIcon.dart';

class BasicHomePageWidget extends StatefulWidget {
  BasicHomePageWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  BasictHomePageWidgetState createState() => BasictHomePageWidgetState();
}

class BasictHomePageWidgetState extends State<BasicHomePageWidget> {

  void pushToMaterialPageRoute(Widget route){
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return route;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Widget简介"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new IntroduceWidget(title: "Widget简介",)),
            ),
            FlatButton(
              child: Text("文本、字体样式"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new TextAndFontStyleWidget(title: "文本、字体样式",))
            ),
            FlatButton(
              child: Text("按钮"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new ButtonWidget(title: "按钮",)),
            ),
            FlatButton(
              child: Text("图片和Icon"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new PictureAndIconWidget(title: "图片和Icon",)),
            )
          ],
        ),
      ),
    );
  }
}