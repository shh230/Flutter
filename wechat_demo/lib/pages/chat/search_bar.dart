import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/search_page.dart';
import 'package:wechat_demo/styles/styles.dart';

import 'chat.dart';

class SearchCell extends StatelessWidget {
  final List<Chat> datas;

  const SearchCell({this.datas});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SearchPage(datas: datas,)));
      },
      child: Container(
        height: 44,
        color: WeChatThemeColor,
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('images/放大镜b.png'),
                  width: 15,
                  color: Colors.grey,
                ),
                Text(
                  '搜索',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const SearchBar({this.onChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;

  void _onChanged(String value) {
    widget.onChanged(value);
    setState(() {
      _showClear = value.length > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      color: WeChatThemeColor,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            height: 44,
            color: WeChatThemeColor,
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenWidth(context) - 40,
                  height: 34,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Row(
                    children: <Widget>[
                      Image(
                          image: AssetImage(
                            'images/放大镜b.png',
                          ),
                          width: 20,
                          color: Colors.grey),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          onChanged: _onChanged,
                          cursorColor: Colors.green,
                          autofocus: true,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 10),
                              border: InputBorder.none,
                              hintText: '搜索',
                              hintStyle: TextStyle(fontSize: 18.0)),
                        ),
                      ),
                      _showClear
                          ? GestureDetector(
                              onTap: () {
                                _controller.clear();
                                _onChanged('');
                              },
                              child: Icon(Icons.cancel),
                            )
                          : Container()
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
