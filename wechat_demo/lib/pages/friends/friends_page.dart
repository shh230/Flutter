/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';
import 'package:wechat_demo/pages/friends/friends_cell.dart';
import 'package:wechat_demo/styles/styles.dart';

import 'friends_data.dart';
import 'index_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final List<Friends> _headerData = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  final List<Friends> _listData = [];

  @override
  void initState() {
    super.initState();
    _listData..addAll(datas)..addAll(datas);
    // 数据进行排序
    _listData.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });
  }

  Widget _buildItemCell(BuildContext context, int index) {
    final bool _isHeaderData = index < _headerData.length;
    final item = _isHeaderData
        ? _headerData[index]
        : _listData[index - _headerData.length];
    if (index < _headerData.length) {
      return FriendsCell(imageAssets: item.imageUrl, name: item.name);
    }
    // 当下标大于固定的数据，并且不是第一条数据的时候，隐藏Letter
    bool _hideIndexLetter = index > _headerData.length &&
        item.indexLetter ==
            _listData[index - _headerData.length - 1].indexLetter;

    return Container(
      child: FriendsCell(
        imageUrl: item.imageUrl,
        name: item.name,
        groupTitle: _hideIndexLetter ? null : item.indexLetter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('通讯录'),
          backgroundColor: WeChatThemeColor,
          centerTitle: true,
          elevation: 0.0,
          // 导航栏下面的阴影
          actions: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Image(
                  image: AssetImage('images/icon_friends_add.png'),
                  width: 25,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DiscoverChildPage(title: '添加朋友')));
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: WeChatThemeColor,
              child: ListView.builder(
                itemCount: _headerData.length + _listData.length,
                itemBuilder: _buildItemCell,
              ),
            ),
            IndexBar(),
          ],
        ));
  }
}
