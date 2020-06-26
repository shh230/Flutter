/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/chat_page.dart';
import 'package:wechat_demo/pages/discover/discover_page.dart';
import 'package:wechat_demo/pages/friends/friends_page.dart';
import 'package:wechat_demo/pages/friends/index_bar.dart';
import 'package:wechat_demo/pages/mine/mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [ChatPage(), FriendsPage(), DiscoverPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          /// 底部导航栏的布局和行为
          /// BottomNavigationBarType.shifting 底部导航栏的位置和大小在点击时会变大
          /// BottomNavigationBarType.fixed 代表tab固定不变
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          currentIndex: _currentIndex,
          fixedColor: Colors.green,
          items: [
            BottomNavigationBarItem(
              title: Text('微信'),
              icon: Image.asset(
                'images/tabbar_chat.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_chat_hl.png',
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('通讯录'),
              icon: Image.asset(
                'images/tabbar_friends.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_friends_hl.png',
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('发现'),
              icon: Image.asset(
                'images/tabbar_discover.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_discover_hl.png',
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('我'),
              icon: Image.asset(
                'images/tabbar_mine.png',
                height: 20,
                width: 20,
              ),
              activeIcon: Image.asset(
                'images/tabbar_mine_hl.png',
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
