import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/search_bar.dart';
import 'package:wechat_demo/pages/components/divider.dart';

import 'chat.dart';

class SearchPage extends StatefulWidget {
  final List<Chat> datas;

  const SearchPage({this.datas});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Chat> _models = [];
  String _searchStr = ''; // 搜索字符串

  TextStyle _normalStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  TextStyle _highlightStyle = TextStyle(
    fontSize: 16,
    color: Colors.green,
  );

  void _searchData(String value) {
    _searchStr = value;
    _models.clear();
    if (value.length > 0) {
      for (int i = 0; i < widget.datas.length; i++) {
        final item = widget.datas[i];
        if (item.name.contains(value)) {
          _models.add(item);
        }
      }
    }

    setState(() {});
  }

  /*
  * 试例：assasas
  *
  * strs: [a, '', a, a, '']
  *
  * i = 0, str = a, 先将 a 置为 normal，在将 a 后面的 _searchStr 置为 highlight (as)
  * i = 1, str = '', 代表当前是连续的 _searchStr, 将 _searchStr 置为 highlight (ass)
  * i = 2, str = a, 先将 a 置为 normal，在将 a 后面的 _searchStr 置为 highlight (assas)
  * i = 3, str = a, 先将 a 置为 normal，在将 a 后面的 _searchStr 置为 highlight (assasas)
  * i = 4, str = '', 不满足 i < strs.length = 1, 不做任何处理
  * */
  Widget _title(String name) {
    List<TextSpan> spans = [];
    List<String> strs = name.split(_searchStr);
    final strsLength = strs.length;

    for (int i = 0; i < strsLength; i++) {
      String str = strs[i];
      if (str == '' && i < strsLength - 1) {
        spans.add(TextSpan(text: _searchStr, style: _highlightStyle));
      } else {
        spans.add(TextSpan(text: str, style: _normalStyle));
        if (i < strsLength - 1) {
          spans.add(TextSpan(text: _searchStr, style: _highlightStyle));
        }
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SearchBar(
            onChanged: (value) {
              _searchData(value);
            },
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: _models.length,
                itemBuilder: _itemCellForRow,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemCellForRow(BuildContext context, int index) {
    final item = _models[index];
    return Column(
      children: [
        ListTile(
          title: _title(item.name),
          subtitle: Container(
            height: 25,
            child: Text(
              item.message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: NetworkImage(item.imageUrl))),
          ),
        ),
        SDivider(
          leftWidth: 75,
        )
      ],
    );
  }
}
