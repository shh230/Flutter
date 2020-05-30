/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';
import 'package:wechat_demo/styles/styles.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'),
        backgroundColor: weChatThemeColor,
        centerTitle: true,
        elevation: 0.0, // 导航栏下面的阴影
      ),
      body: Center(
        child: Text('通讯录页面'),
      ),
    );
  }
}
