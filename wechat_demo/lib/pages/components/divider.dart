import 'package:flutter/material.dart';
import 'package:wechat_demo/styles/styles.dart';

class SDivider extends StatelessWidget {
  final Color color;
  final double leftWidth;
  final Color backgroundColor;

  SDivider({Key key, this.color, this.leftWidth, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theColor = color != null ? color : WeChatThemeColor;
    final _theLeftWidth = leftWidth != null ? leftWidth : 60.0;
    final _theBackgroundColor = backgroundColor != null ? backgroundColor : Colors.white;
    return Row(
      children: <Widget>[
        Container(width: _theLeftWidth, height: 0.5, color: _theBackgroundColor,),
        Expanded(child: Container(height: 0.5, color: _theColor,),)
      ],
    );
  }
}
