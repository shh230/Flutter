/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/chat.dart';
import 'package:wechat_demo/pages/chat/search_bar.dart';
import 'package:wechat_demo/pages/components/divider.dart';
import 'package:wechat_demo/styles/styles.dart';

import 'package:wechat_demo/tools/http_manager.dart' as http;

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  bool _loading = false;
  List<Chat> _chatList = [];
  CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // 获取数据
  void _getData() async {
    setState(() {
      _loading = true;
    });
    try {
      final response = await http.get(
          'http://rap2api.taobao.org/app/mock/256965/api/chat/list',
          timeOut: 6000);
      print('网络请求');
      if (response.statusCode == 200) {
        final responseBody = response.data;
        _chatList = responseBody['chatList']
            .map<Chat>((item) => Chat.formJson(item))
            .toList();
      } else {
        throw Exception('${response.statusMessage}');
      }
    } catch (e) {
      _cancelToken.cancel();
      throw Exception('错误信息');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _buildPopupMenuItem(String imgAss, String title) {
    return Row(
      children: [
        Image(
          image: AssetImage(imgAss),
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget _buildCellForRow(BuildContext context, int index) {
    if (index == 0) {
      return SearchCell(datas: _chatList,);
    }
    // 头部插入了搜索框，所以index需要减1，保证数据的准确性
    index --;
    final item = _chatList[index];
    return Column(
      children: [
        ListTile(
          title: Text(item.name),
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        backgroundColor: WeChatThemeColor,
        centerTitle: true,
        elevation: 0.0,
        // 导航栏下面的阴影
        actions: [
          PopupMenuButton(
            offset: Offset(0, 60),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage('images/圆加.png'),
                width: 25,
              ),
            ),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem>[
                PopupMenuItem(
                    child: _buildPopupMenuItem('images/发起群聊.png', '发起群聊')),
                PopupMenuItem(
                    child: _buildPopupMenuItem('images/添加朋友.png', '添加朋友')),
                PopupMenuItem(
                    child: _buildPopupMenuItem('images/扫一扫1.png', '扫一扫')),
                PopupMenuItem(
                    child: _buildPopupMenuItem('images/收付款.png', '收付款')),
              ];
            },
          )
        ],
      ),
      body: Container(
        child: _loading
            ? Center(
                child: Text('loading...'),
              )
            : ListView.builder(
                itemCount: _chatList.length,
                itemBuilder: _buildCellForRow,
              ),
      ),
    );
  }
}
