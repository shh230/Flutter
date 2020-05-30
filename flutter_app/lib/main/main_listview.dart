import 'package:flutter/material.dart';
import 'package:flutterapp/button/button_page.dart';
import 'package:flutterapp/image/imageView.dart';
import 'package:flutterapp/listView/rand_words.dart';
import 'package:flutterapp/selectionBox/boxView.dart';
import 'package:flutterapp/stateManage/fixManage/parentWidgetC.dart';
import 'package:flutterapp/stateManage/parentManage/parentWidgetB.dart';
import 'package:flutterapp/stateManage/selfManage/tapBox.dart';
import 'package:flutterapp/textFieldAndForm/textfiled_form_page.dart';
import 'package:flutterapp/textView/textWidget.dart';

class MainListView extends StatelessWidget {
  final _dataSource = <Map>[
    {'name': '名字生成器列表', 'type': 0},
    {'name': '自身状态管理', 'type': 1},
    {'name': '父类状态管理', 'type': 2},
    {'name': '混合状态管理', 'type': 3},
    {'name': '文本及样式', 'type': 4},
    {'name': '按钮', 'type': 5},
    {'name': '图片和Icon', 'type': 6},
    {'name': '单选框和复选框', 'type': 7},
    {'name': '输入框和表单', 'type': 8},
  ];
  final _biggerFont = const TextStyle(fontSize: 18.0); // 展示的样式

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('功能列表'),
      ),
      body: _initListView(context),
    );
  }

  Widget _initListView(BuildContext context) {
    final _tiles = _dataSource.map((item) {
      return ListTile(
        title: Text(
          item['name'],
          style: _biggerFont,
        ),
        onTap: () => _handleItemClick(context, item),
      );
    });

    final _divided =
    ListTile.divideTiles(context: context, tiles: _tiles).toList();

    return ListView(
      children: _divided,
    );
  }

  void _handleItemClick(BuildContext context, Map item) {
    var router;
    String _title = item['name'];
    int _type = item['type'];

    // 处理需要跳转的路由
    switch(_type) {
      case 0:
        router = RandomWords();
        break;
      case 1:
        router = TapBoxA();
        break;
      case 2:
        router = ParentWidgetB();
        break;
      case 3:
        router = ParentWidgetC();
        break;
      case 4:
        router = TextWidget();
        break;
      case 5:
        router = ButtonView();
        break;
      case 6:
        router = ImageView();
        break;
      case 7:
        router = BoxMainView();
        break;
      case 8:
        router = TextFiledAndFormPage(title: _title,);
        break;
      default:
        break;
    }

    Navigator.push(
      context,
        new MaterialPageRoute(builder: (context) => router)
    );
  }
}
