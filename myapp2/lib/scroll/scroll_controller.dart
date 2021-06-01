import 'package:flutter/material.dart';

class ScrollControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollControllerWidgetState();
  }
}

class ScrollControllerWidgetState extends State<ScrollControllerWidget> {
  ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false;

  String _progress = "0%";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scroll controller"),
      ),
      body: Center(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Scrollbar(
                child: ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("$index"));
                  },
                ),
              ),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}
