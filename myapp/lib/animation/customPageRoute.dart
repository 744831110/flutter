import 'package:flutter/material.dart';

class CustomPageRouteWidget extends StatefulWidget {
  CustomPageRouteWidget({Key key, this.title}):super(key: key);
  
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new CustomPageRouteWidgetState();
  }
}

class CustomPageRouteWidgetState extends State<CustomPageRouteWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("first widget"),
            FlatButton(
              child: Text("next widget"),
              textColor: Colors.blue,
              onPressed: (){
                // Navigator.push(context, PageRouteBuilder(
                //   transitionDuration: Duration(milliseconds: 500),
                //   pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation){
                //     return new FadeTransition(
                //       opacity: animation,
                //       child: new SecondWidget(title: "自定义路由过渡动画-2",),
                //     );
                //   }
                // ));
                Navigator.push(context, FadeRoute(builder: (context){
                  return new SecondWidget(title: "自定义路由过渡动画-2",);
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondWidget extends StatefulWidget {
  SecondWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return SecondWidgetState();
  }
}

class SecondWidgetState extends State<SecondWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("secode widget"),
            FlatButton(
              child: Text("back widget"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
        //当前路由被激活，是打开新路由
        if(isActive) {
          return FadeTransition(
            opacity: animation,
            child: builder(context),
          );
        } else {
          //是返回，则不应用过渡动画
          return Padding(padding: EdgeInsets.zero,);
        }
    //  return FadeTransition( 
    //    opacity: animation,
    //    child: builder(context),
    //  );
  }
}