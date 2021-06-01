import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dialog"),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
              TextButton(
                child: Text("alert dialog"),
                onPressed: () async {
                  bool delete = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件吗"),
                        actions: [
                          TextButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text("删除"),
                            onPressed: () => Navigator.of(context).pop(true),
                          )
                        ],
                      );
                    },
                  );
                  if (delete == null) {
                    print("取消");
                  } else {
                    print("已确认删除");
                  }
                },
              ),
              TextButton(
                child: Text("simple dialog"),
                onPressed: () async {
                  int i = await showDialog<int>(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("请选择语言"),
                        children: [
                          SimpleDialogOption(
                            child: Padding(
                              child: Text("中文简体"),
                              padding: EdgeInsets.symmetric(vertical: 6),
                            ),
                            onPressed: () {
                              Navigator.pop(context, 1);
                            },
                          ),
                          SimpleDialogOption(
                            child: Padding(
                              child: Text("美国英语"),
                              padding: EdgeInsets.symmetric(vertical: 6),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                  if (i != null) {
                    print("选择了: ${i == 1 ? "中文简体" : "美国英语"}");
                  }
                },
              ),
              TextButton(
                child: Text("list view dialog"),
                onPressed: () async {
                  int index = await showDialog<int>(
                    context: context,
                    builder: (BuildContext context) {
                      var child = Column(
                        children: [
                          ListTile(
                            title: Text("请选择"),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text("$index"),
                                  onTap: () => Navigator.of(context).pop(index),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                      return Dialog(child: child);
                    },
                  );
                  if (index != null) {
                    print("点击了$index");
                  }
                },
              ),
              TextButton(
                child: Text("not dialog"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      var child = Column(
                        children: [
                          ListTile(
                            title: Text("请选择"),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text("$index"),
                                  onTap: () => Navigator.of(context).pop(index),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                      return UnconstrainedBox(
                        constrainedAxis: Axis.vertical,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 200),
                          child: Material(
                            child: child,
                            type: MaterialType.card,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              TextButton(
                child: Text("custom dialog"),
                onPressed: () {
                  showCustomDialog<bool>(
                    context: context,
                    build: (context) {
                      var textButton = TextButton(
                        child: Text("删除"),
                        onPressed: () => Navigator.of(context).pop(true),
                      );
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件吗"),
                        actions: [
                          TextButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          textButton
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<T> showCustomDialog<T>({@required BuildContext context, bool barrierDismissible = true, WidgetBuilder build}) {
    return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          final Widget pageChild = Builder(builder: build);
          return SafeArea(
            child: Builder(
              builder: (BuildContext context) {
                return pageChild;
              },
            ),
          );
        },
        barrierDismissible: barrierDismissible,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black87,
        transitionDuration: Duration(milliseconds: 150),
        transitionBuilder: _buildMaterialDialogTransitions);
  }

  Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }
}
