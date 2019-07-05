import 'package:flutter/material.dart';
import 'basicWidget/basicWidgetEntrance.dart';
import 'layoutWidget/layoutWidgetEntrance.dart';
import 'containerWidget/containerWidgetEntrance.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // routes: {
      //   "new_page": (context)=>NewRoute()
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void pushToMaterialPageRoute(Widget route){
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return route;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("基础Widgets"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new BasicHomePageWidget(title: "基础Widgets",)),
            ),
            FlatButton(
              child: Text("布局式Widgets"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new LayoutWidgetEntranceWidget(title: "布局式Widgets",)),
            ),
            FlatButton(
              child: Text("容器类Widgets"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new ContainerWidgetEntranceWidget(title: "容器类Widgets",)),
            )
          ],
        ),
      ),
    );
  }
}