import 'package:flutter/material.dart';

class SwitchAndCheckBoxWidget extends StatefulWidget {
  SwitchAndCheckBoxWidget({Key key, this.title}):super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return SwitchAndCheckBoxWidgetState();
  }
}

class SwitchAndCheckBoxWidgetState extends State<SwitchAndCheckBoxWidget> {
  bool switchSelected = true;
  bool checkBoxSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: switchSelected,
              onChanged: (value) {
                setState(() {
                  switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: checkBoxSelected,
              activeColor: Colors.red,
              tristate: true,
              onChanged: (value) {
                setState(() {
                  checkBoxSelected = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}