import 'package:flutter/material.dart';
import 'package:myapp2/animate/animatd_switcher.dart';
import 'package:myapp2/animate/animate.dart';
import 'package:myapp2/animate/basic_animate.dart';
import 'package:myapp2/animate/hero.dart';
import 'package:myapp2/animate/router_animate.dart';
import 'package:myapp2/animate/stagger_animate.dart';
import 'package:myapp2/animate/transition_animate.dart';
import 'package:myapp2/base_component/base_component.dart';
import 'package:myapp2/container/clip.dart';
import 'package:myapp2/container/container.dart';
import 'package:myapp2/container/decorated_box.dart';
import 'package:myapp2/custom_widget/circle_progress.dart';
import 'package:myapp2/custom_widget/combination_widget.dart';
import 'package:myapp2/custom_widget/custom_paint.dart';
import 'package:myapp2/custom_widget/custom_widget.dart';
import 'package:myapp2/event/event.dart';
import 'package:myapp2/event/gesture_recognize.dart';
import 'package:myapp2/event/notification.dart';
import 'package:myapp2/event/origin_point_event.dart';
import 'package:myapp2/function/function.dart';
import 'package:myapp2/function/inherited_widget.dart';
import 'package:myapp2/function/will_pop_scope.dart';
import 'package:myapp2/layout/align.dart';
import 'package:myapp2/layout/linear_layout.dart';
import 'function/async_update.dart';
import 'function/dialog.dart';
import 'function/provider.dart';
import 'router/newRouter.dart';
import 'base_component/state_manager.dart';
import 'base_component/text.dart';
import 'base_component/button.dart';
import 'base_component/image.dart';
import 'base_component/switch_checkbox.dart';
import 'base_component/input.dart';
import 'base_component/indicator.dart';
import 'layout/layout.dart';
import 'layout/linear_layout.dart';
import 'layout/flex.dart';
import 'layout/flow.dart';
import 'layout/cascad.dart';
import 'layout/align.dart';
import 'container/container.dart';
import 'container/padding.dart';
import 'container/constrained_box.dart';
import 'container/decorated_box.dart';
import 'container/transform.dart';
import 'container/scaffold.dart';
import 'container/clip.dart';
import 'scroll/scroll.dart';
import 'scroll/single_child_scrollview.dart';
import 'scroll/listview.dart';
import 'scroll/gridview.dart';
import 'scroll/custom_scroll_view.dart';
import 'scroll/scroll_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "home_page": (context) => MyHomePage(
              title: "flutter demo home page",
            ),
        "new_page": (context) => NewRoute(
              text: ModalRoute.of(context).settings.arguments,
            ),
        "base_component": (context) => BaseComponentWidget(),
        "state_manager": (context) => StateManagerWidget(),
        "text": (context) => TextWidget(),
        "button": (context) => ButtonWidget(),
        "image": (context) => ImageWidget(),
        "switch_and_checkbox": (context) => SwitchAndCheckBoxTestRoute(),
        "input": (context) => InputWidget(),
        "indicator": (context) => IndicatorWidget(),
        "layout": (context) => LayoutWidget(),
        "linear_layout": (context) => LinearLayoutWidget(),
        "flex": (context) => FlexWidget(),
        "flow": (context) => FlowWidget(),
        "cascad": (context) => CascadWidget(),
        "align": (context) => AlignWidget(),
        "container": (context) => ContainerWidget(),
        "padding": (context) => PaddingWidget(),
        "constrainted_box": (context) => ConstainedBoxWidget(),
        "decorated_box": (context) => DecoratedBoxWidget(),
        "transform": (context) => TransformWidget(),
        "scaffold": (context) => ScaffoldWidget(),
        "clip": (context) => ClipWidget(),
        "scroll": (context) => ScrollWidget(),
        "single_child_scroll": (context) => SingleChildScrollWidget(),
        "list_view": (context) => ListWidget(),
        "grid_view": (context) => GridViewWidget(),
        "custom_scroll_view": (context) => CustomScrollViewWidget(),
        "scroll_controller": (context) => ScrollControllerWidget(),
        "will_pop_scope": (context) => WillPopScopeWidget(),
        "inherited_widget": (context) => InheritedWidgetTestRoute(),
        "provider": (context) => ProviderRoute(),
        "async_update": (context) => AsyncUpdateWidget(),
        "dialog": (context) => DialogWidget(),
        "function": (context) => FunctionWidget(),
        "event": (context) => EventWidget(),
        "origin_point_event": (context) => OriginPointEventWidget(),
        "gesture_recognize": (context) => GestureRecognizeWidget(),
        "notification": (context) => NotificationWidget(),
        "animated": (context) => AnimationWidget(),
        "basic_animated": (context) => BasicAnimatedWidget(),
        "router_animated": (context) => RouterAnimatedWidget(),
        "hero": (context) => HeroAnimationRoute(),
        "stagger_animate": (context) => StaggerRoute(),
        "animated_switcher": (context) => AnimatedSwitcherCounterRoute(),
        "transition_animate": (context) => TransitionAnimateWidget(),
        "custom_widget": (context) => CustomWidget(),
        "combination_widget": (context) => CombinationWidget(),
        "custom_painter": (context) => CustomPaintRoute(),
        "circle_progress": (context) => GradientCircularProgressRoute()
      },
      initialRoute: "home_page",
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("open new route"),
              onPressed: () async {
                var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute(
                    text: "123123",
                  );
                }));
                print("return value is result $result");
              },
            ),
            TextButton(
              child: Text(
                "open new route with name",
              ),
              onPressed: () => Navigator.pushNamed(context, "new_page", arguments: "hi"),
            ),
            TextButton(
              child: Text("base component"),
              onPressed: () => Navigator.pushNamed(context, "base_component"),
            ),
            TextButton(
              child: Text("layout"),
              onPressed: () => Navigator.pushNamed(context, "layout"),
            ),
            TextButton(
              child: Text("container"),
              onPressed: () => Navigator.pushNamed(context, "container"),
            ),
            TextButton(
              child: Text("scroll"),
              onPressed: () => Navigator.pushNamed(context, "scroll"),
            ),
            TextButton(
              child: Text("function"),
              onPressed: () => Navigator.pushNamed(context, "function"),
            ),
            TextButton(
              child: Text("event"),
              onPressed: () => Navigator.pushNamed(context, "event"),
            ),
            TextButton(
              child: Text("animated"),
              onPressed: () => Navigator.pushNamed(context, "animated"),
            ),
            TextButton(
              child: Text("custom widget"),
              onPressed: () => Navigator.pushNamed(context, "custom_widget"),
            )
          ],
        ),
      ),
    );
  }
}
