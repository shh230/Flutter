/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';
import 'package:wechat_demo/styles/styles.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final String subImageName;

  const DiscoverCell({
    Key key,
    @required this.title,
    this.subTitle,
    @required this.imageName,
    this.subImageName,
  })  : assert(title != null, 'title 不能为空'),
        assert(imageName != null, 'imageName 不能为空');

  @override
  _DiscoverCellState createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;
  TextStyle _subTitleTextStyle = TextStyle(fontSize: 12.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                DiscoverChildPage(title: widget.title)));
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentColor = weChatThemeColor;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapCancel: () {
        setState(() {
          _currentColor = Colors.white;
        });
      },
      child: Container(
        height: 54,
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        color: _currentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // left
            Container(
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage(widget.imageName),
                    width: 20,
                  ),
                  SizedBox(width: 15),
                  Text(widget.title)
                ],
              ),
            ),
            // right
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    widget.subTitle != null ? widget.subTitle : '',
                    style: _subTitleTextStyle,
                  ),
                  widget.subImageName != null
                      ? Container(
                          child: Image(
                            image: AssetImage(widget.subImageName),
                            width: 15,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        )
                      : Container(),
                  Image(
                    image: AssetImage('images/icon_right.png'),
                    width: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
