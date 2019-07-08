import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatefulWidget {
  CustomScrollViewWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return CustomScrollViewWidgetState();
  }
}

class CustomScrollViewWidgetState extends State<CustomScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Demo"),
              background: Image.asset(
                "./images/avatar.png", fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return Container(
                  alignment: Alignment.center,
                  child: Text("grid item $index", style: TextStyle(color: Colors.blue),),
                );
              },
              childCount: 20
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return Container(
                alignment: Alignment.center,
                child: Text("grid item $index", style: TextStyle(color: Colors.blue),),
              );
            },
            childCount: 50
            ),
          )
        ],
      ),
    );
  }
}