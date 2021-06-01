import 'package:flutter/material.dart';

class SingleChildScrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("singleChildScrollView"),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: "ABCDEFGHIJKLMNOPQISTUVWXYZ"
                    .split("")
                    .map((e) => Text(
                          e,
                          textScaleFactor: 2.0,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
