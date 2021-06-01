import 'package:flutter/material.dart';

class FlowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flow"),
      ),
      body: Center(
        child: Column(
          children: [
            // 溢出
            // Row(
            //   children: [Text("data" * 100)],
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("123" * 20),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              alignment: WrapAlignment.center,
              children: [
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                  label: Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('M'),
                  ),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('H'),
                  ),
                  label: Text('Mulligan'),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('J'),
                  ),
                  label: Text('Laurens'),
                )
              ],
            ),
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
              children: [
                createContainerWithColor(Colors.red),
                createContainerWithColor(Colors.green),
                createContainerWithColor(Colors.blue),
                createContainerWithColor(Colors.yellow),
                createContainerWithColor(Colors.brown),
                createContainerWithColor(Colors.purple),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container createContainerWithColor(Color color) {
    return Container(
      width: 80,
      height: 80,
      color: color,
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
