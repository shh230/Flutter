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
import 'package:wechat_demo/styles/const.dart';
import 'package:wechat_demo/styles/styles.dart';

import 'friends_data.dart';
import 'index_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> with AutomaticKeepAliveClientMixin {
  final List<Friends> _headerData = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  // 存储列表的偏移量
  final Map<String, double> _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };

  final List<Friends> _listData = [];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listData..addAll(datas)..addAll(datas);
    // 数据进行排序
    _listData.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });

    final _cellHeight = cellHeight + dividerHeight; // cell 的高度（带灰色线条）
    final _headerHeight = _cellHeight + sectionHeight + dividerHeight; // 带 section 的 cell 的高度
    double _groupOffset = _cellHeight * 4;
    for (int i = 0; i < _listData.length; i++) {
      if (i < 1) {
        _groupOffsetMap.addAll({_listData[i].indexLetter : _groupOffset});
        // 保存完毕后增加偏移量
        _groupOffset += _headerHeight;
      } else if (_listData[i].indexLetter == _listData[i - 1].indexLetter) {
        _groupOffset += _cellHeight;
      } else {
        _groupOffsetMap.addAll({_listData[i].indexLetter : _groupOffset});
        _groupOffset += _headerHeight;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

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
    super.build(context);
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
                controller: _scrollController,
                itemCount: _headerData.length + _listData.length,
                itemBuilder: _buildItemCell,
              ),
            ),
            IndexBar(
              IndexBarCallBack: (letter) {
                if (_groupOffsetMap[letter] != null) {
                  _scrollController.animateTo(_groupOffsetMap[letter],
                      duration: Duration(microseconds: 1), curve: Curves.easeIn);
                }
              },
            ),
          ],
        ));
  }
}
