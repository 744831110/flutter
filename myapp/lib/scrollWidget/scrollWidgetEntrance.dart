import 'package:flutter/material.dart';
import 'singleChildScrollViewWidget.dart';
import 'listViewWidget.dart';
import 'gridViewWidget.dart';
import 'customScrollView.dart';
import 'scrollListenerWidget.dart';

class ScrollWidgetEntranceWidget extends StatefulWidget {
  ScrollWidgetEntranceWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return ScrollWidgetEntranceWidgetState();
  }
}

class ScrollWidgetEntranceWidgetState extends State<ScrollWidgetEntranceWidget> {
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
              child: Text("SingleChildScrollView"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new SingleChildScrollViewWidget(title: "SingleChildScrollView",));
              },
            ),
            FlatButton(
              child: Text("ListView"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new ListViewWidget(title: "ListView",));
              },
            ),
            FlatButton(
              child: Text("gridViewWidget"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new GridViewWidget(title: "gridViewWidget",));
              },
            ),
            FlatButton(
              child: Text("customScrollView"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new CustomScrollViewWidget(title: "customScrollView",));
              },
            ),
            FlatButton(
              child: Text("scrollListenerWidget"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new ScrollListenerWidget(title: "scrollListenerWidget",));
              },
            )
          ],
        ),
      ),
    );
  }
}