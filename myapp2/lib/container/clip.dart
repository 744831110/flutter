import 'package:flutter/material.dart';

class ClipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("clip"),
      ),
      body: Center(
        child: Column(
          children: [
            avatar,
            ClipOval(
              child: avatar,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
                Text(
                  "hello world",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                Text(
                  "hello world",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.blue,
              child: ClipRect(
                clipper: MyClipper(),
                child: avatar,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
