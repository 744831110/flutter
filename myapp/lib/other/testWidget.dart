import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {

  int i = 123;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test widget"),),
      body: Center(
        child: LevelWidget(
          color: Colors.blue,
        )
      ),
    );
  }
}

class LevelWidget extends StatefulWidget {
  LevelWidget({Key key, this.color = Colors.white}): super(key: key);

  final Color color;

  @override
  State<StatefulWidget> createState() {
    return LevelWidgetState();
  }
}

class LevelWidgetState extends State<LevelWidget> with SingleTickerProviderStateMixin {
  
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 1.0, end: 0.2).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Material(
                        color: Color.fromRGBO(144, 144, 214, 1),
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
                          child: Text(
                            "lv: 2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("在做10题可以升级到下一个级别",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.5)),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width - 50,
                height: 20,
                // child: AnimatedBuilder(
                //   animation: animation,
                //   builder: (context, child) {
                //     return Container(
                //       width: (MediaQuery.of(context).size.width - 50) * animation.value,
                //       height: 20,
                //       color: Colors.red,
                //     );
                //   },
                // ),
                child: ContainerTransition(
                  animation: animation,
                  width: (MediaQuery.of(context).size.width - 50),
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.5)),
                    color: Colors.red
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ContainerTransition extends StatelessWidget {
  ContainerTransition({
    this.animation,
    this.child,
    this.width,
    this.height,
    this.direction,
    this.decoration
  });
  final Animation<double> animation;
  final Widget child;
  final double width;
  final double height;
  final Axis direction;
  final Decoration decoration;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child){
        return Container(
          width: width * animation.value,
          height: height,
          decoration: decoration,
          child: child,
        );
      },
    );
  }
}