import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget({Key key, this.title}): super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return ButtonWidgetState();
  }
}

class ButtonWidgetState extends State<ButtonWidget> {
  var raisedButtonTitle = "RaisedButtonTitle";
  var flatButtonTitle = "FlatButtonTitle";
  var outlineButtonTitle = "outlineButtonTitle";
  var iconButtonIcon = Icon(Icons.thumb_up);
  var customFlatButtonTitle = "customFlatButtonTitle";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(raisedButtonTitle),
              onPressed: () => setState(() => raisedButtonTitle = "isClick")
            ),
            FlatButton(
              child: Text(flatButtonTitle),
              onPressed: () => setState(() => flatButtonTitle = "isClick"),
            ),
            OutlineButton(
              child: Text(outlineButtonTitle),
              onPressed: () => setState(() => outlineButtonTitle = "isClick"),
            ),
            IconButton(
              icon: iconButtonIcon,
              onPressed: () => setState(() => iconButtonIcon = Icon(Icons.thumb_down)),
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text(customFlatButtonTitle),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () => setState(() => customFlatButtonTitle = "isClick"),
            )
          ],
        ),
      ),
    );
  }
}