import 'dart:collection';

import 'package:flutter/material.dart';

class Item {
  double price;
  int count;
  Item(this.price, this.count);
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.count * element.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ChangeNotifier implements Listenable {
  List listeners = [];
  @override
  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listeners.remove(listener);
  }

  void notifyListeners() {
    listeners.forEach((element) => element());
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key key, this.data, this.child});
  final Widget child;
  final T data;

  static T of<T>(BuildContext context, {bool listen = true}) {
    var provider = (listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
            .widget) as InheritedProvider<T>;
    return provider.data;
  }

  @override
  State<StatefulWidget> createState() {
    return _ChangeNotifierProviderState<T>();
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider> {
  void update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    print("didupdatewidget");
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    print("initstate");
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(data: widget.data, child: widget.child);
  }
}

class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);
  final Widget child;
  final Widget Function(BuildContext context, T value) builder;
  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context, listen: true),
    );
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProviderRouteState();
  }
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provide router"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Container(
                height: 500,
                child: Column(
                  children: [
                    Consumer<CartModel>(
                      builder: (context, cart) {
                        if (cart == null) {
                          return Text("总价: 0 cart == null");
                        } else {
                          return Text("总价: ${cart.totalPrice}");
                        }
                      },
                    ),
                    TextButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        ChangeNotifierProvider.of<CartModel>(context,
                                listen: false)
                            .add(Item(20.0, 1));
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
