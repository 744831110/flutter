import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ButtonWidgetState();
  }
}

class ButtonWidgetState extends State<ButtonWidget> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("TextButton"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                print("text button");
              },
            ),
            TextButton(
              child: Text("TextButton"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.red.withOpacity(0.2);
                    }
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed)) {
                      return Colors.yellow.withOpacity(0.4);
                    }
                    return null;
                  },
                ),
              ),
              onPressed: () {
                print("text button");
              },
            ),
            TextButton(
              child: Text("TextButton"),
              onPressed: () {
                print("text button");
              },
              style: TextButton.styleFrom(primary: Colors.red),
            ),
            TextButton(
              child: Text("FlatButton"),
              onPressed: () {
                print("flatbutton");
              },
              style: flatButtonStyle,
            ),
            ElevatedButton(
              child: Text("RaisedButton"),
              onPressed: () {
                print("raisedbutton");
              },
              style: raisedButtonStyle,
            ),
            OutlinedButton(
              child: Text("onlinedButton"),
              onPressed: () {
                print("outlinedbutton");
              },
              style: outlineButtonStyle,
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {
                print("iconbutton");
              },
            )
          ],
        ),
      ),
    );
  }
}
