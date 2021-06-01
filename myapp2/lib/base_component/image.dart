import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imageUri = "asset/res/icon_button.png";
    String imageUrl =
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4";
    return Scaffold(
      appBar: AppBar(
        title: Text("image"),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(imageUri),
              width: 50,
            ),
            Image.asset(imageUri),
            Image(
              image: NetworkImage(imageUrl),
              width: 50,
            ),
            Image.network(
              imageUrl,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
