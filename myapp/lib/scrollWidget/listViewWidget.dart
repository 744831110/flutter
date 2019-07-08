import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewWidget extends StatefulWidget {
  ListViewWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return ListViewWidgetState();
  }
}

class ListViewWidgetState extends State<ListViewWidget> {
  static const loadingTag = "##loading##"; //表尾标记
  var words = <String>[loadingTag];

  Widget blueDivider = Divider(color: Colors.blue,);
  Widget greenDivider = Divider(color: Colors.green,);

  @override
  void initState() {
    super.initState();
    // retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      // body: ListView.builder(
      body: Column(
        children: <Widget>[
          ListTile(title: Text("单词列表"),),
          Expanded(
            child: ListView.separated(
              itemCount: words.length,
              itemBuilder: (BuildContext context, int index) {
                // return ListTile(title: Text("$index"),);
                if(words[index] == loadingTag) {
                  if (words.length-1 < 100) {
                    retrieveData();
                    return Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2.0,),
                      ),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Text("没有更多了", style: TextStyle(color: Colors.grey),),
                    );
                  }
                }
                return ListTile(title: Text(words[index]),);
              },
              separatorBuilder: (BuildContext context, int index){
                return index%2 == 0 ? blueDivider : greenDivider;
              },
            ),
          )
        ],
      )
    );
  }
    void retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      words.insertAll(words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }
}