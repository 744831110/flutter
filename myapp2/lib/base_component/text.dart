import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextState();
  }
}

class TextState extends State<TextWidget> {
  TapGestureRecognizer _tapRecognizer = TapGestureRecognizer()
    ..onTap = () {
      print("tap text");
    };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Hello world" * 6,
              textAlign: TextAlign.center,
            ),
            Text(
              "Hello world, i'm jack" * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world",
              textScaleFactor: 1.5,
            ),
            Text(
              "Hello world hello world",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(color: Colors.blue),
                    recognizer: _tapRecognizer),
              ]),
            ),
            DefaultTextStyleWidget(),
          ],
        ),
      ),
    );
  }
}

class DefaultTextStyleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("hello world"),
          Text("i am jack"),
          Text(
            "i am jack",
            style: TextStyle(
              color: Colors.grey,
              inherit: false,
            ),
          ),
        ],
      ),
    );
  }
}
