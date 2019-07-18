import 'package:flutter/material.dart';

class TurnBoxWidget extends StatefulWidget {
  TurnBoxWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return TurnBoxWidgetState();
  }
}

class TurnBoxWidgetState extends State<TurnBoxWidget> {
  double turns = .0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: turns,
              speed: 500,
              child: Icon(Icons.refresh, size: 50,),
            ),
            TurnBox(
              turns: turns,
              speed: 500,              child: Icon(Icons.refresh, size: 150,),
            ),
            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: (){
                setState(() {
                  turns += .2;
                });
              },
            ),
            RaisedButton(
              child: Text("逆时针旋转1/5圈"),
              onPressed: (){
                setState(() {
                  turns -= .2;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class TurnBox extends StatefulWidget {
  const TurnBox({
    Key key,
    this.turns = .0,
    this.speed = 200,
    this.child
  }):super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return TurnBoxState();
  }
}

class TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity,
    );
    controller.value = widget.turns;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns){
      controller.animateTo(
        widget.turns,
        duration:Duration(milliseconds: widget.speed ?? 200),
        curve: Curves.easeOut
      );
    }
  }
}