/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';

class TextFiledAndFormPage extends StatefulWidget {
  final String title;

  const TextFiledAndFormPage({Key key, this.title}) : super(key: key);

  @override
  _TextFiledAndFormPageState createState() => _TextFiledAndFormPageState();
}

class _TextFiledAndFormPageState extends State<TextFiledAndFormPage> {
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// 设置默认值
    _usernameController.text = 'hello world';
    /// 从第三个字符开始选中后面的字符
    _usernameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _usernameController.text.length);
    _usernameController.addListener(() {
      print('controller:${_usernameController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _initView(),
    );
  }

  Widget _initView() {
    return Column(
      children: <Widget>[
        TextField(
//          onChanged: (value) {
//            print('$value');
//          },
          autofocus: true,
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '用户名或邮箱',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: '密码',
            hintText: '您的登录密码',
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        )
      ],
    );
  }
}

//class TextFiledAndFormPage extends StatelessWidget {
//  final String title;
//
//  const TextFiledAndFormPage({Key key, this.title}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('$title'),
//      ),
//      body: _initView(),
//    );
//  }
//
//  Widget _initView() {
//    return Container(
//      child: Text('收到了刚开机'),
//    );
//  }
//}
