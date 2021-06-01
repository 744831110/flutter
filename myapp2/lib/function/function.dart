import 'package:flutter/material.dart';

class FunctionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("function"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: Text("WillPopScopeWidget"),
              onPressed: () => Navigator.pushNamed(context, "will_pop_scope"),
            ),
            TextButton(
              child: Text("InheritedWidget"),
              onPressed: () => Navigator.pushNamed(context, "inherited_widget"),
            ),
            TextButton(
              child: Text("ProviderRoute"),
              onPressed: () => Navigator.pushNamed(context, "provider"),
            ),
            TextButton(
              child: Text("async update"),
              onPressed: () => Navigator.pushNamed(context, "async_update"),
            ),
            TextButton(
              child: Text("dialog"),
              onPressed: () => Navigator.pushNamed(context, "dialog"),
            )
          ],
        ),
      ),
    );
  }
}
