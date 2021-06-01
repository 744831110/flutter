import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListWidgetState();
  }
}

class ListWidgetState extends State<ListWidget> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.green,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("listView"),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text("商品列表"),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  if (_words[index] == loadingTag) {
                    if (_words.length - 1 < 100) {
                      _retrieveData();
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                      );
                    }
                  }
                  return ListTile(
                    title: Text(_words[index]),
                  );
                },
                separatorBuilder: (BuildContext contextm, int index) {
                  return index % 2 == 0 ? divider1 : divider2;
                },
                itemCount: _words.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
