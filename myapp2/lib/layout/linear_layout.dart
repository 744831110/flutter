import 'package:flutter/material.dart';

class LinearLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("linear layout"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [createText(), createText()],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [createText(), createText()],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: [createText(), createText()],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: [
                Text(
                  "hello world",
                  style: TextStyle(fontSize: 30),
                ),
                createText()
              ],
            ),
            // 相同的row或column进行嵌套的时候，只有最外面的row或column会占用尽可能大的空间，而里面的Row或Column所占用的空间为实际大小
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                createText(),
                createText(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text createText() {
    return Text("hello world");
  }
}
