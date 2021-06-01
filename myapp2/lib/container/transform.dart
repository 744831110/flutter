import 'package:flutter/material.dart';
import 'dart:math';

class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("transform"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                color: Colors.black,
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.skewY(0.3),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: const Text('Apartment for rent'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.translate(
                  offset: Offset(-20.0, -5.0),
                  child: Text("hello world"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.rotate(
                  angle: pi / 2,
                  child: Text("hellow world"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.scale(
                  scale: 1.5,
                  child: Text("hello world"),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 150,
              width: 200,
              child: Align(
                alignment: Alignment.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text("hello world"),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              constraints: BoxConstraints.tightFor(width: 200, height: 150),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topLeft,
                  radius: .98,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ],
              ),
              transform: Matrix4.rotationZ(.2),
              alignment: Alignment.center,
              child: Text(
                "5.20",
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
