import 'package:flutter/material.dart';
import 'basicAnimation.dart';
import 'customPageRoute.dart';
import 'heroAnimation.dart';
import 'staggerAnimation.dart';

class AnimationEntranceWidget extends StatefulWidget {
  AnimationEntranceWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return AnimationEntranceWidgetState();
  }
}

class AnimationEntranceWidgetState extends State<AnimationEntranceWidget> {
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
              child: Text("动画基本结构"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new BasicAnimationWidget(title: "动画基本结构",));
              },
            ),
            FlatButton(
              child: Text("自定义路由过渡动画"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new CustomPageRouteWidget(title: "自定义路由过渡动画",));
              },
            ),
            FlatButton(
              child: Text("Hero动画"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new HeroAnimationWidget(title: "Hero动画",));
              },
            ),
            FlatButton(
              child: Text("交错动画"),
              textColor: Colors.blue,
              onPressed: (){
                pushToMaterialPageRoute(new StaggerAnimationWidget(title: "交错动画",));
              },
            )
          ],
        ),
      ),
    );
  }
}