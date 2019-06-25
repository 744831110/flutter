import 'package:flutter/material.dart';

class InputBoxAndFormWidget extends StatefulWidget{
  InputBoxAndFormWidget({Key key, this.title}):super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return InputBoxAndFormWidgetState();
  }
}

class InputBoxAndFormWidgetState extends State<InputBoxAndFormWidget> {
  //输入框
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode usernameNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  Color usernameBorderColor = Colors.grey[200];
  Color passwordBorderColor = Colors.grey[200];
  String text = "";
  //表单
  GlobalKey formKey= new GlobalKey<FormState>();
  TextEditingController usernameFormController = TextEditingController();
  TextEditingController passwordFormController = TextEditingController();

  @override
  void initState() {
    
    super.initState();
    usernameController.text = "hello world";
    usernameNode.addListener((){
      setState(() {
        if (usernameNode.hasFocus) {
          text = "username textfield has focus";
          usernameBorderColor = Colors.blue[200];
        } else {
          usernameBorderColor = Colors.grey[200];
        }
      });
    });
    passwordNode.addListener((){
      setState(() {
        if (passwordNode.hasFocus){
          text = "password textfield has focus";
          passwordBorderColor = Colors.blue[200];
        } else {
          passwordBorderColor = Colors.grey[200];
        }
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none
                ),
                controller: usernameController,
                focusNode: usernameNode,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: usernameBorderColor,width: 2)
                )
              ),
            ),
            Container(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "密码",
                  prefixIcon: Icon(Icons.lock),
                  border: InputBorder.none
                ),
                obscureText: true,
                controller: passwordController,
                focusNode: passwordNode,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: passwordBorderColor,width: 2)
                )
              ),
            ),
            Text(text),
            RaisedButton(
              child: Text("移动焦点"),
              onPressed: (){
                setState(() {
                  FocusScope.of(context).requestFocus(passwordNode);
                });
              },
            ),
            RaisedButton(
              child: Text("隐藏键盘"),
              onPressed: (){
                setState(() {
                  usernameNode.unfocus();
                  passwordNode.unfocus();
                  text = "no textfield has focus";
                });
              },
            ),
            Form(
              key: formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: usernameFormController,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.email)
                    ),
                    validator: (v){
                      return v.trim().length > 0 ? null : "用户名不能为空";
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: passwordFormController,
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "密码",
                      icon: Icon(Icons.lock)
                    ),
                    validator: (v){
                      return v.trim().length > 6 ? null : "密码不小于5位";
                    },
                  ),
                  RaisedButton(
                    child: Text("登录"),
                    onPressed: (){
                      if ((formKey.currentState as FormState).validate()) {
                        print("验证成功");
                      } else {
                        print("验证失败");
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
