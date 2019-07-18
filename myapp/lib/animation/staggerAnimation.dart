import 'package:flutter/material.dart';

class StaggerAnimationWidget extends StatefulWidget {
  StaggerAnimationWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return StaggerAnimationWidgetState();
  }
}

class StaggerAnimationWidgetState extends State<StaggerAnimationWidget> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          playAnimation();
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: StaggerAnimation(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> playAnimation() async {
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled {

    }
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}): super(key: key){
    height = Tween<double>(
      begin: .0,
      end: 300.0
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6,
          curve: Curves.ease
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6,
          curve: Curves.ease,
        ),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1.0,
          curve: Curves.ease,
        )
      )
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: buildAnimation,
      animation: controller,
    );
  }
}