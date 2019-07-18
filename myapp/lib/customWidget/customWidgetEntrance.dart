import 'package:flutter/material.dart';
import 'gradientButton.dart';
import 'turnBox.dart';
import 'gradientCircularProgressWidget.dart';

class CustomWidgetEntranceWidget extends StatefulWidget {
  CustomWidgetEntranceWidget({Key key, this.title}):super(key: key);

  final String title;
  
  @override
  State<StatefulWidget> createState() {
    return CustomWidgetEntranceWidgetState();
  }
}

class CustomWidgetEntranceWidgetState extends State<CustomWidgetEntranceWidget> {
  void pushToMaterialPageRoute(Widget route){
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return route;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("gradientButton"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new GradientButtonWidget(title: "gradientButton",));
              },
            ),
            FlatButton(
              child: Text("turnBox"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new TurnBoxWidget(title: "turnBox",));
              },
            ),
            FlatButton(
              child: Text("圆形渐变进度条"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new GradientCircularProgressWidget(title: "圆形渐变进度条",));
              },
            )
          ],
        ),
      ),
    );
  }
}