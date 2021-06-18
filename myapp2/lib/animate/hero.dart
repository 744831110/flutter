import 'package:flutter/material.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hero"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar",
            child: ClipOval(
              child: Image.asset(
                "asset/res/icon_button.png",
                width: 50.0,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                return FadeTransition(opacity: animation, child: HeroAnimationRouteB());
              }),
            );
          },
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原图"),
      ),
      body: Center(
        child: Hero(
          tag: "avatar",
          child: Image.asset("asset/res/icon_button.png"),
        ),
      ),
    );
  }
}
