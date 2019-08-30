import 'package:flutter/material.dart';

class BasicAnimationWidget extends StatefulWidget {
  BasicAnimationWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return BasicAnimationWidgetState();
  }
}

class BasicAnimationWidgetState extends State<BasicAnimationWidget> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(seconds: 1), vsync: this);
    // animation = new CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 0.75).animate(controller);
    // ..addListener((){
    //   setState((){});
    // });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset("lib/images/pic2.jpg",
            // width: animation.value,
            // height: animation.value)

            // 使用AnimatedWidget简化
            // AnimatedImage(animation: animation,)

            //用AnimatedBuilder重构
            AnimatedBuilder(
              animation: animation,
              child: Container(
                color: Colors.blue,
              ),
              builder: (context, child){
                return Center(
                  child: Container(
                    height: 25,
                    width: animation.value * MediaQuery.of(context).size.width,
                    child: child,
                  ),
                );
              },
            )

            // 封装常见的动画
            // GrowTransition(
            //   animation: animation,
            //   child: Image.asset("lib/images/pic2.jpg"),
            // )
            // ParallelAnimateImage(
            //   animation: animation,
            //   child: Image.asset("lib/images/pic2.jpg"),
            // )
          ],
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

// class AnimatedImage extends AnimatedWidget {
//   AnimatedImage({Key key, Animation<double> animation})
//       : super(key: key, listenable: animation);

//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return new Center(
//       child: Image.asset("lib/images/pic2.jpg",
//           width: animation.value,
//           height: animation.value
//       ),
//     );
//   }
// }


// class GrowTransition extends StatelessWidget {
//   GrowTransition({this.child, this.animation});

//   final Widget child;
//   final Animation<double> animation;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedBuilder(
//         animation: animation,
//         builder: (context, child){
//           return Container(
//             height: animation.value,
//             width: animation.value,
//             child: child,
//           );
//         },
//         child: child,
//       ),
//     );
//   }
// }

// class ParallelAnimateImage extends AnimatedWidget {
//   ParallelAnimateImage({Key key, Animation<double> animation, this.child}):super(key: key, listenable: animation);
//   static final opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
//   static final sizeTween = new Tween<double>(begin: 0.0, end: 300.0);
//   final Widget child;
  
//     Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return new Center(
//       child: new Opacity(
//         opacity: opacityTween.evaluate(animation),
//         child: new Container(
//           margin: new EdgeInsets.symmetric(vertical: 10.0),
//           height: sizeTween.evaluate(animation),
//           width: sizeTween.evaluate(animation),
//           child: child,
//         ),
//       ),
//     );
//   }
// }