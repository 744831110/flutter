import 'package:flutter/material.dart';

class _ShareDataWidget extends InheritedWidget {
  _ShareDataWidget({@required this.data, Widget child}) : super(child: child);
  final int data;

  static _ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(covariant _ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _InheritedTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedTestWidgetState();
  }
}

class _InheritedTestWidgetState extends State<_InheritedTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_ShareDataWidget.of(context).data.toString()),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("dependecies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetTestRouteState();
  }
}

class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("inherited widgt"),
      ),
      body: Center(
        child: _ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: _InheritedTestWidget(),
              ),
              TextButton(
                child: Text("Increment"),
                onPressed: () {
                  setState(() {
                    ++count;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
