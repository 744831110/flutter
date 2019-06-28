import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FlexLayoutWidget extends StatefulWidget {

  FlexLayoutWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return FlexLayoutWidgetState();
  }
}

class FlexLayoutWidgetState extends State<FlexLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text(widget.title),),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.green,
                ),
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                    height: 30,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    height: 300,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}