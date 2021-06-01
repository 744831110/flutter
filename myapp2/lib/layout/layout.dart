import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("layout"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("linear button"),
              onPressed: () => Navigator.pushNamed(context, "linear_layout"),
            ),
            TextButton(
              child: Text("flex"),
              onPressed: () => Navigator.pushNamed(context, "flex"),
            ),
            TextButton(
              child: Text("flow"),
              onPressed: () => Navigator.pushNamed(context, "flow"),
            ),
            TextButton(
              child: Text("cascad"),
              onPressed: () => Navigator.pushNamed(context, "cascad"),
            ),
            TextButton(
              child: Text("align"),
              onPressed: () => Navigator.pushNamed(context, "align"),
            )
          ],
        ),
      ),
    );
  }
}
