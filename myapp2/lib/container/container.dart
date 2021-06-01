import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("container"),
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
            child: Text("padding"),
            onPressed: () => Navigator.pushNamed(context, "padding"),
          ),
          TextButton(
            child: Text("constrainted box"),
            onPressed: () => Navigator.pushNamed(context, "constrainted_box"),
          ),
          TextButton(
            child: Text("decorated box"),
            onPressed: () => Navigator.pushNamed(context, "decorated_box"),
          ),
          TextButton(
            child: Text("transform"),
            onPressed: () => Navigator.pushNamed(context, "transform"),
          ),
          TextButton(
            child: Text("scaffold"),
            onPressed: () => Navigator.pushNamed(context, "scaffold"),
          ),
          TextButton(
            child: Text("clip"),
            onPressed: () => Navigator.pushNamed(context, "clip"),
          )
        ],
      )),
    );
  }
}
