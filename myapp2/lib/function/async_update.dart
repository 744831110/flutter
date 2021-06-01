import 'package:flutter/material.dart';

class AsyncUpdateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AsyncUpdateWidgetState();
  }
}

class AsyncUpdateWidgetState extends State<AsyncUpdateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("async udpate"),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    return Text("Content: ${snapshot.data}");
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            StreamBuilder<int>(
              stream: counter(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("没有Stream");
                  case ConnectionState.waiting:
                    return Text("等待数据");
                  case ConnectionState.active:
                    return Text("active: ${snapshot.data}");
                  case ConnectionState.done:
                    return Text("stream已关闭");
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "get network data");
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
}
