import 'package:flutter/material.dart';
import 'dart:math';
import 'turnBox.dart';

class GradientCircularProgressWidget extends StatefulWidget {
  GradientCircularProgressWidget({Key key, this.title}):super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return GradientCircularProgressWidgetState();
  }
}

class GradientCircularProgressWidgetState extends State<GradientCircularProgressWidget> with TickerProviderStateMixin{
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );
    bool isForword = true;
    controller.addStatusListener((status){
      if (status == AnimationStatus.forward) {
        isForword = true;
      } else if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        if (isForword) {
          controller.reverse();
        } else {
          controller.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForword = false;
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget child){
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
                                stokeWidth: 3.0,
                                value: controller.value,
                              ),
                              GradientCircularProgressIndicator(
                                colors: [Colors.red, Colors.orange],
                                radius: 50.0,
                                stokeWidth: 3.0,
                                value: controller.value,
                              ),
                              GradientCircularProgressIndicator(
                                colors: [Colors.red, Colors.orange, Colors.red],
                                radius: 50.0,
                                stokeWidth: 5.0,
                                value: controller.value,
                              ),
                              GradientCircularProgressIndicator(
                                colors: [Colors.teal, Colors.cyan],
                                radius: 50.0,
                                stokeWidth: 5.0,
                                strokeCapRound: true,
                                value: CurvedAnimation(
                                        parent: controller,
                                        curve: Curves.decelerate)
                                    .value,
                              ),
                              TurnBox(
                                turns: 1 / 8,
                                child: GradientCircularProgressIndicator(
                                    colors: [Colors.red, Colors.orange, Colors.red],
                                    radius: 50.0,
                                    stokeWidth: 5.0,
                                    strokeCapRound: true,
                                    backgroundColor: Colors.red[50],
                                    totalAngle: 1.5 * pi,
                                    value: CurvedAnimation(
                                            parent: controller,
                                            curve: Curves.ease)
                                        .value),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: GradientCircularProgressIndicator(
                                    colors: [Colors.blue[700], Colors.blue[200]],
                                    radius: 50.0,
                                    stokeWidth: 3.0,
                                    strokeCapRound: true,
                                    backgroundColor: Colors.transparent,
                                    value: controller.value),
                              ),
                              GradientCircularProgressIndicator(
                                colors: [
                                  Colors.red,
                                  Colors.amber,
                                  Colors.cyan,
                                  Colors.green[200],
                                  Colors.blue,
                                  Colors.red
                                ],
                                radius: 50.0,
                                stokeWidth: 5.0,
                                strokeCapRound: true,
                                value: controller.value,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  GradientCircularProgressIndicator({
    Key key,
    @required this.radius,
    @required this.colors,
    this.stops,
    this.strokeCapRound = false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle = 2 * pi,
    this.stokeWidth,
    this.value
  });

  // 粗细
  final double stokeWidth;
  // 圆的半径
  final double radius;
  // 两端是否为圆角
  final bool strokeCapRound;
  // 当前进度，取值范围[0.0-1.0]
  final double value;
  // 进度条背景颜色
  final Color backgroundColor;
  // 进度条总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;
  // 渐变色数组
  final List<Color> colors;
  // 渐变色的终止点，对应colors属性
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double offset = .0;
    if (strokeCapRound) {
      offset = asin(stokeWidth / (radius * 2 - stokeWidth));
    }
    var gradientColors = colors;
    if (gradientColors == null){
      Color color = Theme.of(context).accentColor;
      gradientColors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: GradientCircularProgressPainter(
          stokeWidth: stokeWidth,
          strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: gradientColors,
        ),
      ),
    );
  }

}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    this.stokeWidth: 10.0,
    this.strokeCapRound: false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.radius,
    this.total = 2 * pi,
    @required this.colors,
    this.stops,
    this.value
  });

  final double stokeWidth;
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
    double _offset = stokeWidth / 2.0;
    double _value = value ?? .0;
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(stokeWidth/ (size.width - stokeWidth));
    }

    Rect rect = Offset(_offset, _offset) & Size(
        size.width - stokeWidth,
        size.height - stokeWidth
    );

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = stokeWidth;

    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(
          rect,
          _start,
          total,
          false,
          paint
      );
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
          paint
      );
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}