import 'package:flutter/material.dart';

class BasicAnimatedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicAnimatedWidgetState();
  }
}

class BasicAnimatedWidgetState extends State<BasicAnimatedWidget> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  // 1. 基础动画使用
  // @override
  // void initState() {
  //   super.initState();
  //   controller = new AnimationController(duration: const Duration(seconds: 3), vsync: this);
  //   animation = new Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn))
  //     ..addListener(() {
  //       setState(() {});
  //     });
  //   controller.forward();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("basic animated"),
  //     ),
  //     body: Center(
  //       child: Image.asset(
  //         "asset/res/icon_button.png",
  //         width: animation.value,
  //         height: animation.value,
  //       ),
  //     ),
  //   );
  // }

  // 2 封装
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("basic animated"),
      ),
      body: Center(
        // 2.1 使用AnimatedWidget
        // child: AnimatedImage(
        //   animation: animation,
        // ),

        // 2.2 使用AnimatedBuilder
        // child: AnimatedBuilder(
        //   animation: animation,
        //   child: Image.asset("asset/res/icon_button.png"),
        //   builder: (BuildContext context, Widget child) {
        //     return Center(
        //       child: Container(
        //         width: animation.value,
        //         height: animation.value,
        //         child: child,
        //       ),
        //     );
        //   },
        // ),

        // 2.3 封装transition动画
        child: GrowTransition(
          animation: animation,
          child: Image.asset("asset/res/icon_button.png"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Image.asset(
      "asset/res/icon_button.png",
      width: animation.value,
      height: animation.value,
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext context, Widget child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
