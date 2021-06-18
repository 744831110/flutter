import 'package:flutter/material.dart';

class AnimationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("animated"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("basic animate"),
              onPressed: () => Navigator.pushNamed(context, "basic_animated"),
            ),
            TextButton(
              child: Text("router animated"),
              onPressed: () {
                Navigator.pushNamed(context, "router_animated");
              },
            ),
            TextButton(
              child: Text("hero"),
              onPressed: () {
                Navigator.pushNamed(context, "hero");
              },
            ),
            TextButton(
              child: Text("stagger animate"),
              onPressed: () {
                Navigator.pushNamed(context, "stagger_animate");
              },
            ),
            TextButton(
              child: Text("animated switcher"),
              onPressed: () {
                Navigator.pushNamed(context, "animated_switcher");
              },
            ),
            TextButton(
              child: Text("transition animate"),
              onPressed: () {
                Navigator.pushNamed(context, "transition_animate");
              },
            ),
            TextButton(
              child: Text("combination widget"),
              onPressed: () {
                Navigator.pushNamed(context, "combination_widget");
              },
            )
          ],
        ),
      ),
    );
  }
}
