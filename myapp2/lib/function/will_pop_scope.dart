import 'package:flutter/material.dart';

class WillPopScopeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WillPopScopeWidgetState();
  }
}

class WillPopScopeWidgetState extends State<WillPopScopeWidget> {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("will pop scope"),
      ),
      body: Center(
        child: WillPopScope(
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(milliseconds: 500)) {
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
          child: Container(
            alignment: Alignment.center,
            child: Text("0.5秒内连续按两次返回键退出"),
          ),
        ),
      ),
    );
  }
}
