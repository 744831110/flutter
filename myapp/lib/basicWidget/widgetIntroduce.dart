import 'package:flutter/material.dart';

class IntroduceWidget extends StatefulWidget {
  IntroduceWidget({Key key, this.title}): super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return IntroduceWidgetState();
  }
}

class IntroduceWidgetState extends State<IntroduceWidget> {
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
            EchoWidget(
              text: "this is a Echo",
            ),
            FlatButton(
              child: Text("CounterWidget"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new CounterRoute())
            ),
            FlatButton(
              child: Text("TapBoxAWidget"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new TapBoxARoute())
            ),
            FlatButton(
              child: Text("TapBoxBParentWidget"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new TapBoxBParentRoute())
            ),
            FlatButton(
              child: Text("TapBoxCParentWidget"),
              textColor: Colors.blue,
              onPressed: () => this.pushToMaterialPageRoute(new TapBoxCParentRoute()),
            ),
          ],
        ),
      ),
    );
  }
}

// stateless widget
class EchoWidget extends StatelessWidget {

  const EchoWidget(
    {
      Key key,
      @required this.text,
      this.backgroundColor: Colors.green,
    }
  ): super(key: key);

  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text)
      ),
    );
  }
}

// stateful widget
class CounterWidget extends StatefulWidget {
  const CounterWidget ({
    Key key,
    this.initValue: 10
  });

  final int initValue;

  @override
  State<StatefulWidget> createState() {
    return new _CounterWidgetState();
  }

}

class _CounterWidgetState extends State<CounterWidget> {

  int counter;
  
  // 当Widget第一次插入到Widget树时会被调用，对于每一个State对象，Flutter framework只会调用一次该回调。
  // 所以，通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等。
  // 不能在该回调中调用BuildContext.inheritFromWidgetOfExactType
  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
    print("initState");
  }

  // 它主要是用于构建Widget子树，会在以下场景被调用
  // 在调用initState()之后。
  // 在调用didUpdateWidget()之后。
  // 在调用setState()之后。
  // 在调用didChangeDependencies()之后。
  // 在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
  @override
  Widget build(BuildContext context) {
    print("build");
    return FlatButton(
      child: Text("$counter"),
      onPressed: () => setState(() => counter--,
      ),
    );
  }

  // 在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点
  // 然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调
  // Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  // 当State对象从树中被移除时，会调用此回调。
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  // 当State对象从树中被永久移除时调用，通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  // 当State对象的依赖发生变化时会被调用
  // 当build中的父widget发生变化，则子widget的didCHangeDepencies会被调用
  // 典型的场景是当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class CounterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CounterWidget"),
      ),
      body: Center(
        child: CounterWidget(),
      ),
    );
  }
}

//widget管理自身状态
class TapBoxAWidget extends StatefulWidget {
  TapBoxAWidget({Key key}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TapBoxAWidgetState();
  }
}

class TapBoxAWidgetState extends State<TapBoxAWidget> {
  bool isActive = false;

  void handleTap(){
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: Container(
        child: Center(
          child: Text(
            isActive ? "Active" : "inActive",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: isActive ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapBoxARoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("TapBoxAWidget"),
      ),
      body: Center(
        child: TapBoxAWidget(),
      ),
    );
  }
}

//父widget管理子widget的state
class TapBoxBWidget extends StatelessWidget {
  TapBoxBWidget({
    Key key,
    this.isActive,
    @required this.onChange
  });

  final bool isActive;
  final ValueChanged<bool> onChange;

  void handleTap() {
    onChange(!isActive);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: Container(
        child: Center(
          child: new Text(
            isActive ? "active" : "inActive",
            style: new TextStyle(fontSize: 32, color: Colors.green)
          ),
        ),
        width: 150,
        height: 150,
        decoration: new BoxDecoration(
          color: isActive ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapBoxBParentWidget extends StatefulWidget {
  TapBoxBParentWidget({Key key}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new TapBoxBParentWidgetState();
  }
}

class TapBoxBParentWidgetState extends State<TapBoxBParentWidget> {
  bool isActive = false;
  void handleTap(bool newValue) {
    setState(() {
      isActive = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: TapBoxBWidget(
        isActive: isActive,
        onChange: handleTap,
        ),
      ),
    );
  }
}

class TapBoxBParentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("TapBoxBParentWidget"),
      ),
      body: TapBoxBParentWidget(),
    );
  }
}

//混合管理
class TapBoxCWidget extends StatefulWidget {
  TapBoxCWidget({
    Key key,
    this.active,
    @required this.onChange,
  });
  final bool active;
  final ValueChanged<bool> onChange;

  @override
  State<StatefulWidget> createState() {
    return TapBoxCWidgetState();
  }
}

class TapBoxCWidgetState extends State<TapBoxCWidget> {
  bool highLight = false;

  void handleTapDown(TapDownDetails details) {
    setState(() {
      highLight = true;
    });
  }
  
  void handleTapUp(TapUpDetails details) {
    setState(() {
      highLight = false;
    });
  }

  void handleTapCancle() {
    setState(() {
      highLight = false;
    });
  }

  void handleTap() {
    widget.onChange(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      onTapUp: handleTapUp,
      onTapDown: handleTapDown,
      onTapCancel: handleTapCancle,
      child: Container(
        child: Center(
          child: new Text(
            widget.active ? "active" : "inActive",
            style: new TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: highLight ? new Border.all(color: Colors.red, width: 10) : null,
        ),
      ),
    );
  }
}

class TapBoxCParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TapBoxCParentWidgetState();
  }
}

class TapBoxCParentWidgetState extends State<TapBoxCParentWidget> {
  bool isActive = false;

  void handleTapBoxChange(bool newValue){
    setState(() {
      isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: TapBoxCWidget(
          active: isActive,
         onChange: handleTapBoxChange,
       ),
      ),
    );
  }
}

class TapBoxCParentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("TapBoxCParentWidget"),
      ),
      body: TapBoxCParentWidget(),
    );
  }
}