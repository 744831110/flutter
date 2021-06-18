import 'package:flutter/material.dart';

class CombinationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CombinationWidgetState();
  }
}

class CombinationWidgetState extends State<CombinationWidget> {
  double _turns = .0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("combination widget"),
      ),
      body: Container(
        child: Column(
          children: [
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50.0,
              child: Text("Submit"),
              onPressed: () => print("first"),
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green[700]],
              child: Text("Submit"),
              onPressed: () => print("seconde"),
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightBlue[300], Colors.blueAccent],
              child: Text("Submit"),
              onPressed: () => print("third"),
            ),
            Row(
              children: [
                TextButton(
                  child: Text("顺时针0.2圈"),
                  onPressed: () {
                    setState(() {
                      _turns += .2;
                    });
                  },
                ),
                TurnBox(
                  turns: _turns,
                  speed: 500,
                  child: Icon(
                    Icons.refresh,
                    size: 50,
                  ),
                ),
                TextButton(
                  child: Text("逆时针0.2圈"),
                  onPressed: () {
                    setState(() {
                      _turns -= .2;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final List<Color> colors;
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final GestureTapCallback onPressed;
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ?? [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
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

class TurnBox extends StatefulWidget {
  final double turns;
  final int speed;
  final Widget child;
  const TurnBox({Key key, this.turns = .0, this.speed = 200, this.child})
      : super(
          key: key,
        );
  @override
  State<StatefulWidget> createState() {
    return TurnBoxState();
  }
}

class TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity,
    );
    _controller.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(covariant TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed ?? 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
