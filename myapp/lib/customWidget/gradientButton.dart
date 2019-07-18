import 'package:flutter/material.dart';

class GradientButtonWidget extends StatefulWidget {
  GradientButtonWidget({Key key, this.title}):super(key: key);

  final String title;
  
  @override
  State<StatefulWidget> createState() {
    return GradientButtonWidgetState();
  }
}

class GradientButtonWidgetState extends State<GradientButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GradientButton(
              buttonColors: [Colors.orange, Colors.red],
              height: 50,
              child: Text("submit"),
              onTap: (){
                print("click first submit button");
              },
            ),
            GradientButton(
              buttonColors: [Colors.lightGreen, Colors.green[700]],
              height: 50,
              child: Text("submit"),
              onTap: (){
                print("click second submit button");
              },
            ),
            GradientButton(
              buttonColors: [Colors.lightBlue[300], Colors.blueAccent],
              height: 50,
              child: Text("submit"),
              onTap: (){
                print("click third submit button");
              },
            )
          ],
        )
      ),
    );
  }
}

class GradientButton extends StatelessWidget {

  GradientButton({
    this.buttonColors,
    this.width,
    this.height,
    this.onTap,
    @required this.child
  });
  
  final List<Color> buttonColors;
  final double height;
  final double width;

  final Widget child;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> colors = buttonColors ?? [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}