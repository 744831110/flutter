import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  GridViewWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return GridViewWidgetState();
  }
}

class GridViewWidgetState extends State<GridViewWidget> {
  List<IconData> icons = [
    Icons.all_inclusive,
    Icons.beach_access, Icons.cake,
    Icons.free_breakfast
  ]; //保存Icon数据

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3.0
                ),
                children: <Widget>[
                  Icon(Icons.title),
                  Icon(Icons.toc),
                  Icon(Icons.today),
                  Icon(Icons.tonality),
                  Icon(Icons.touch_app),
                  Icon(Icons.toys),
                ],
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  childAspectRatio: 3.0
                ),
                children: <Widget>[
                  Icon(Icons.title),
                  Icon(Icons.toc),
                  Icon(Icons.today),
                  Icon(Icons.tonality),
                  Icon(Icons.touch_app),
                  Icon(Icons.toys),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 3.0
                ),
                itemCount: icons.length,
                itemBuilder: (BuildContext context, int index){
                  if (index == icons.length-1 && icons.length<200){
                    retrieveIcons();
                  }
                  return Icon(icons[index]);
                },
              ),
            )
          ],
        )
      ),
    );
  }

  void retrieveIcons() {
    Future.delayed(Duration(milliseconds: 2000)).then((e) {
      setState(() {
        icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}