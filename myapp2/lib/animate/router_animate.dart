import 'package:flutter/material.dart';

class RouterAnimatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("router animate"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("渐入渐出"),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                      return FadeTransition(opacity: animation, child: TestRouterAnimatedWidget());
                    },
                  ),
                );
              },
            ),
            TextButton(
              child: Text("渐入渐出 fade router"),
              onPressed: () {
                Navigator.push(
                  context,
                  FadeRoute(
                    builder: (context) {
                      return TestRouterAnimatedWidget();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class TestRouterAnimatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test router animated widget"),
      ),
    );
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({@required this.builder, this.transitionDuration = const Duration(milliseconds: 300), this.opaque = true, this.barrierDismissible = false, this.barrierColor, this.barrierLabel, this.maintainState = true});

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
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
