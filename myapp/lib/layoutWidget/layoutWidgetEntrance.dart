import 'package:flutter/material.dart';
import 'package:myapp/layoutWidget/cascadeLayout.dart';
import 'linearLayout.dart';
import 'flexLayout.dart';
import 'flowLayout.dart';

class LayoutWidgetEntranceWidget extends StatefulWidget {
  LayoutWidgetEntranceWidget({ Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return LayoutWidgetEntranceWidgetState();
  }
}

class LayoutWidgetEntranceWidgetState extends State<LayoutWidgetEntranceWidget> {

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
              child: Text("线性布局Row,Column"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new LinearLayoutWidget(title: "线性布局Row,Column",));
              },
            ),
            FlatButton(
              child: Text("弹性布局Flex,expanded"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new FlexLayoutWidget(title: "弹性布局Flex,expanded"));
              },
            ),
            FlatButton(
              child: Text("流式布局Flow,Wrap"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new FlowLayoutWidget(title: "流式布局Flow,Wrap",));
              },
            ),
            FlatButton(
              child: Text("层叠布局Stack,Positioned"),
              textColor: Colors.blue,
              onPressed: (){
                this.pushToMaterialPageRoute(new CascadeLayoutWidget(title: "层叠布局Stack,Positioned",));
              },
            )
          ],
        ),
      ),
    );
  }
}