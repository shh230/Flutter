/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';
import 'package:wechat_demo/styles/styles.dart';

class DiscoverChildPage extends StatefulWidget {
  final String title;

  const DiscoverChildPage({Key key, this.title}) : super(key: key);

  @override
  _DiscoverChildPageState createState() => _DiscoverChildPageState();
}

class _DiscoverChildPageState extends State<DiscoverChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: WeChatThemeColor,
        centerTitle: true,
        elevation: 0.0, // 导航栏下面的阴影
      ),
      body: Center(
          child: Text(widget.title)
      ),
    );
  }
}
