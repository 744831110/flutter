import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/other/testWidget.dart';
import 'basicWidget/basicWidgetEntrance.dart';
import 'layoutWidget/layoutWidgetEntrance.dart';
import 'containerWidget/containerWidgetEntrance.dart';
import 'scrollWidget/scrollWidgetEntrance.dart';
import 'eventAndNotification/eventAndNotificationEntrance.dart';
import 'animation/animationEntrance.dart';
import 'customWidget/customWidgetEntrance.dart';
import 'other/otherEntranceWidget.dart';

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

  @override
  void initState() {
    super.initState();
    test();
  }

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
            ),
            FlatButton(
              child: Text("可滚动Widgets"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new ScrollWidgetEntranceWidget(title: "可滚动Widgets",)),
            ),
            FlatButton(
              child: Text("事件处理与通知"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new EventAndNotificationEntranceWidget(title: "事件处理与通知",)),
            ),
            FlatButton(
              child: Text("动画结构"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new AnimationEntranceWidget(title: "动画结构",)),
            ),
            FlatButton(
              child: Text("自定义Widget"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new CustomWidgetEntranceWidget(title: "自定义Widget",)),
            ),
            FlatButton(
              child: Text("其他"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new OtherEntranceWidget(title: "其他",)),
            ),
            FlatButton(
              child: Text("test"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new TestWidget()),
            ),
            FlatButton(
              child: Text("cookie"),
              textColor: Colors.blue,
              onPressed: (){
                String str = "OUTFOX_SEARCH_USER_ID=-2048661168@10.200.160.12; Created=587289147; Path=/login/acc; Domain=k12internal.youdao.com; Expires=04 Aug 2049 15:52:26 GMT";
                Cookie cookie = Cookie.fromSetCookieValue(str);
                print('${cookie.name}  ${cookie.value}  ${cookie.path}   ${cookie.domain}');
                
              },
            )
          ],
        ),
      ),
    );
  }

  Future<int> testInt() async {
    int i = 0;
    i++;
    int j = await i;
    return j;
  }

  void test(){
    print("test print 1");
    testInt().then((v) => print(v));
    print("test print 2");
  }
}