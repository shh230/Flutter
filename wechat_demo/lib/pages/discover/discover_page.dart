/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';
import 'package:wechat_demo/styles/styles.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Color _themeColor = weChatThemeColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
        backgroundColor: _themeColor,
        centerTitle: true,
        elevation: 0.0, // 导航栏下面的阴影
      ),
      body: Container(
        color: _themeColor,
        child: ListView(
          children: <Widget>[
            DiscoverCell(
              title: '朋友圈',
              imageName: 'images/朋友圈.png',
            ),
            SizedBox(height: 10,),
            DiscoverCell(
              imageName: 'images/扫一扫2.png',
              title: '扫一扫',
            ),
            _buildDivider(),
            DiscoverCell(
              imageName: 'images/摇一摇.png',
              title: '摇一摇',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/看一看icon.png',
              title: '看一看',
            ),
            _buildDivider(),
            DiscoverCell(
              imageName: 'images/搜一搜 2.png',
              title: '搜一搜',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/附近的人icon.png',
              title: '附近的人',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/购物.png',
              title: '购物',
              subTitle: '618限时特价',
              subImageName: 'images/badge.png',
            ),
            _buildDivider(),
            DiscoverCell(
              imageName: 'images/游戏.png',
              title: '游戏',
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/小程序.png',
              title: '小程序',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: <Widget>[
        Container(width: 60, height: 0.5, color: Colors.white,),
        Container(height: 0.5, color: _themeColor,)
      ],
    );
  }
}
