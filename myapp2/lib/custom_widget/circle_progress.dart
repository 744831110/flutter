import 'package:flutter/material.dart';
import 'package:myapp2/custom_widget/combination_widget.dart';
import 'dart:math';

class GradientCircularProgressRoute extends StatefulWidget {
  @override
  GradientCircularProgressRouteState createState() {
    return new GradientCircularProgressRouteState();
  }
}

class GradientCircularProgressRouteState extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("circle_progress"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 16.0,
                          children: <Widget>[
                            GradientCircularProgressIndicator(
                              // No gradient
                              colors: [Colors.blue, Colors.blue],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange, Colors.red],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.teal, Colors.cyan],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              value: CurvedAnimation(parent: _animationController, curve: Curves.decelerate).value,
                            ),
                            TurnBox(
                              turns: 1 / 8,
                              child: GradientCircularProgressIndicator(
                                  colors: [Colors.red, Colors.orange, Colors.red],
                                  radius: 50.0,
                                  strokeWidth: 5.0,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.red[50],
                                  totalAngle: 1.5 * pi,
                                  value: CurvedAnimation(parent: _animationController, curve: Curves.ease).value),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: GradientCircularProgressIndicator(
                                  colors: [Colors.blue[700], Colors.blue[200]], radius: 50.0, strokeWidth: 3.0, strokeCapRound: true, backgroundColor: Colors.transparent, value: _animationController.value),
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.amber, Colors.cyan, Colors.green[200], Colors.blue, Colors.red],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              value: _animationController.value,
                            ),
                          ],
                        ),
                        GradientCircularProgressIndicator(
                          colors: [Colors.blue[700], Colors.blue[200]],
                          radius: 100.0,
                          strokeWidth: 20.0,
                          value: _animationController.value,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: GradientCircularProgressIndicator(
                            colors: [Colors.blue[700], Colors.blue[300]],
                            radius: 100.0,
                            strokeWidth: 20.0,
                            value: _animationController.value,
                            strokeCapRound: true,
                          ),
                        ),
                        //剪裁半圆
                        ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: .5,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox(
                                //width: 100.0,
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    colors: [Colors.teal, Colors.cyan[500]],
                                    radius: 100.0,
                                    strokeWidth: 8.0,
                                    value: _animationController.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 104.0,
                          width: 200.0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(
                                height: 200.0,
                                top: .0,
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    colors: [Colors.teal, Colors.cyan[500]],
                                    radius: 100.0,
                                    strokeWidth: 8.0,
                                    value: _animationController.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "${(_animationController.value * 100).toInt()}%",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double radius;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final double totalAngle;
  final List<Color> colors;
  final List<double> stops;
  GradientCircularProgressIndicator({
    this.strokeWidth = 2.0,
    @required this.radius,
    @required this.colors,
    this.stops,
    this.strokeCapRound = false,
    this.backgroundColor = Colors.transparent,
    this.totalAngle = 2 * pi,
    this.value = 0,
  });
  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
          strokeWidth: strokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
          colors: _colors,
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({this.strokeWidth: 10.0, this.strokeCapRound: false, this.backgroundColor = const Color(0xFFEEEEEE), this.radius, this.total = 2 * pi, @required this.colors, this.stops, this.value});

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2.0;
    double _value = (value ?? .0);
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;
    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }
    Rect rect = Offset(_offset, _offset) & Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }
    if (_value > 0) {
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      ).createShader(rect);
      canvas.drawArc(
        rect,
        _start,
        _value,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
