import 'package:flutter/material.dart';
import 'package:flutterapp/listView/rand_words.dart';
import 'package:flutterapp/stateManager/tapBox.dart';

class MainListView extends StatelessWidget {
  final _dataSource = <Map>[
    {'name': '名字生成器列表', 'type': 0},
    {'name': '状态管理', 'type': 1}
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
        onTap: () => _handleItemClick(context, item['type']),
      );
    });

    final _divided =
    ListTile.divideTiles(context: context, tiles: _tiles).toList();

    return ListView(
      children: _divided,
    );
  }

  void _handleItemClick(BuildContext context, int type) {
    var router;

    // 处理需要跳转的路由
    switch(type) {
      case 0:
        router = RandomWords();
        break;
      case 1:
        router = TapBoxA();
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
