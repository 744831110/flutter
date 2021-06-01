import 'package:flutter/material.dart';

class ScrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scroll"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("singleChildScrollView"),
              onPressed: () =>
                  Navigator.pushNamed(context, "single_child_scroll"),
            ),
            TextButton(
              child: Text("listView"),
              onPressed: () => Navigator.pushNamed(context, "list_view"),
            ),
            TextButton(
              child: Text("gridView"),
              onPressed: () => Navigator.pushNamed(context, "grid_view"),
            ),
            TextButton(
              child: Text("customscrollview"),
              onPressed: () =>
                  Navigator.pushNamed(context, "custom_scroll_view"),
            ),
            TextButton(
              child: Text("scrollcontroller"),
              onPressed: () =>
                  Navigator.pushNamed(context, "scroll_controller"),
            )
          ],
        ),
      ),
    );
  }
}
