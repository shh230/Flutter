/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';
import 'package:wechat_demo/styles/styles.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        backgroundColor: WeChatThemeColor,
        centerTitle: true,
        elevation: 0.0,
        // 导航栏下面的阴影
        actions: [
          PopupMenuButton(
            offset: Offset(0 ,60),
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
      body: Center(
        child: Text('微信页面'),
      ),
    );
  }
}
