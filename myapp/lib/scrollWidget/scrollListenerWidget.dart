import 'package:flutter/material.dart';

class ScrollListenerWidget extends StatefulWidget {
  ScrollListenerWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return ScrollListenerWidgetState();
  }
}

class ScrollListenerWidgetState extends State<ScrollListenerWidget> {
  ScrollController scrollController = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  String progressString = "0%";

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      print(scrollController.offset);
      if(scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (scrollController.offset > 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification){
            double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            setState(() {
              int num = (progress * 100).toInt();
              if(num>100) num = 100;
              progressString = "$num%";
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 40,
                controller: scrollController,
                itemBuilder: (context, index){
                  return ListTile(title: Text("$index"),);
                },
              ),
              CircleAvatar(
                radius: 30,
                child: Text(progressString),
                backgroundColor: Colors.black,
              )
            ],
          ),
        )
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          if(scrollController.hasClients){
            scrollController.animateTo(
              .0, 
              duration: Duration(milliseconds: 200),
              curve: Curves.ease);
          }
        },
      ),
    );
  }
}

// class ScrollControllerTestRoute extends StatefulWidget {
//   @override
//   ScrollControllerTestRouteState createState() {
//     return new ScrollControllerTestRouteState();
//   }
// }

// class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
//   ScrollController _controller = new ScrollController();
//   bool showToTopBtn = false; //是否显示“返回到顶部”按钮

//   @override
//   void initState() {
//     //监听滚动事件，打印滚动位置
//     _controller.addListener(() {
//       print(_controller.offset); //打印滚动位置
//       if (_controller.offset < 1000 && showToTopBtn) {
//         setState(() {
//           showToTopBtn = false;
//         });
//       } else if (_controller.offset >= 1000 && showToTopBtn == false) {
//         setState(() {
//           showToTopBtn = true;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     //为了避免内存泄露，需要调用_controller.dispose
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("滚动控制")),
//       body: Scrollbar(
//         child: ListView.builder(
//             itemCount: 100,
//             itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
//             controller: _controller,
//             itemBuilder: (context, index) {
//               return ListTile(title: Text("$index"),);
//             }
//         ),
//       ),
//       floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
//           child: Icon(Icons.arrow_upward),
//           onPressed: () {
//             //返回到顶部时执行动画
//             _controller.animateTo(.0,
//                 duration: Duration(milliseconds: 200),
//                 curve: Curves.ease
//             );
//           }
//       ),
//     );
//   }
// }