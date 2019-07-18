import 'package:flutter/material.dart';

// class HeroAnimationWidget extends StatefulWidget {
//   HeroAnimationWidget({Key key, this.title}):super(key: key);

//   final String title;

//   @override
//   State<StatefulWidget> createState() {
//     return HeroAnimationWidgetState();
//   }
// }

class HeroAnimationWidget extends StatelessWidget{
  HeroAnimationWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset("lib/images/pic2.jpg",
                  width: 50.0,
                ),
              ),
            ),
            onTap: () {
              //打开B路由  
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return new FadeTransition(
                      opacity: animation,
                      child: HeroAnimationRouteB()
                    );
                  })
              );
            },
          ),
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero动画-2"),),
      body: Center(
        child: Hero(
          tag: "avatar",
          child: GestureDetector(
            child: Image.asset("lib/images/pic2.jpg", width: 50.0,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}