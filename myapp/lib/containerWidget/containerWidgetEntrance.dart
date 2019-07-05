import 'package:flutter/material.dart';
import 'paddingWidget.dart';
import 'constrainedBox.dart';
import 'decoratedBoxWidget.dart';
import 'transformWidget.dart';
import 'containerWidget.dart';
import 'appHomeWidget.dart';

class ContainerWidgetEntranceWidget extends StatefulWidget {
  ContainerWidgetEntranceWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return ContainerWidgetEntranceWidgetState();
  }
}

class ContainerWidgetEntranceWidgetState extends State<ContainerWidgetEntranceWidget> {
  void pushToMaterialPageRoute(Widget route){
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return route;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("padding"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new PaddingWidget(title: "padding",));
              },
            ),
            FlatButton(
              child: Text("constrainedBoxWidget"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new ConstrainedBoxWidget(title: "constrainedBox and sizedBox",));
              },
            ),
            FlatButton(
              child: Text("decoratedBox"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new DecoratedBoxWidget(title: "decoratedBox",));
              },
            ),
            FlatButton(
              child: Text("transform"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new TransformWidget(title: "transform",));
              },
            ),
            FlatButton(
              child: Text("container"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new ContainerWidget(title: "container"));
              },
            ),
            FlatButton(
              child: Text("app home"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new AppHomeWidget(title: "app Home"));
              },
            )
          ],
        ),
      ),
    );
  }
}