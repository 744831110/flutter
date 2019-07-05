import 'package:flutter/material.dart';

class AppHomeWidget extends StatefulWidget {
  AppHomeWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return AppHomeWidgetState();
  }
}

class AppHomeWidgetState extends State<AppHomeWidget> with SingleTickerProviderStateMixin {
  static GlobalKey<ScaffoldState> globalKey= new GlobalKey();
  int selectIndex = 1;
  TabController tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white,),
            onPressed: (){
              print("open drawer");
              globalKey.currentState.openDrawer();
            },
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){},)
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: tabs.map((e) => Tab(text:e)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
      //     BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("business")),
      //     BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("school"))
      //   ],
      //   currentIndex: selectIndex,
      //   fixedColor: Colors.blue,
      //   onTap: barItemTap,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            Icon(Icons.home),
            SizedBox(width: 50,height: 50,),
            Icon(Icons.business)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: ButtonTheme(
        height: 50,
        minWidth: 50,
        child: FlatButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          child: Text("+",textScaleFactor: 1,),
          onPressed: (){},
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: tabs.map((e){
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5,),
          );
        }).toList(),
      )
    );
  }

  void barItemTap(int index){
    // setState(() {
    //   selectIndex = index;
    // });
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/pic1.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text("wendux", style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("add account"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("manger account"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}