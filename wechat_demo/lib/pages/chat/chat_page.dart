/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/chat.dart';
import 'package:wechat_demo/pages/components/divider.dart';
import 'package:wechat_demo/styles/styles.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool _loading = false;
  List<Chat> _chatList = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  // 获取数据
  void _getData() async {
    setState(() {
      _loading = true;
    });
    var client = http.Client();
    try {
      final response = await client
          .get('http://rap2.taobao.org:38080/app/mock/256965/api/chat/list');
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        _chatList = responseBody['chatList']
            .map<Chat>((item) => Chat.formJson(item))
            .toList();
      } else {
        throw Exception('${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('${e.reasonPhrase}');
    } finally {
      client.close();
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

  @override
  Widget build(BuildContext context) {
    final tiles = _chatList.map((item) {
      return Container(
        color: Colors.white,
        child: Column(
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
        ),
      );
    }).toList();

//    final divides =
//    ListTile.divideTiles(context: context, tiles: tiles).toList();

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
            : ListView(
                children: tiles,
              ),
      ),
    );
  }
}
