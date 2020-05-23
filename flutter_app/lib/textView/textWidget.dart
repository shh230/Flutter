import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  double _width = 9999;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('自身状态管理'),
      ),
      body: _initView(),
    );
  }

  // 初始化试图
  Widget _initView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          width: _width,
          child: Text(
            'TextAlign.left',
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: _width,
          child: Text(
            'TextAlign.right',
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          width: _width,
          child: Text(
            'TextAlign.center',
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: _width,
          child: Text(
            'TextAlign.justify',
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
          width: _width,
          child: Text(
            'TextAlign.start',
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          width: _width,
          child: Text(
            'TextAlign.end',
            textAlign: TextAlign.end,
          ),
        ),
        Divider(),
        Container(
          width: _width,
          child: Text(
            "TextOverflow.clip " * 5,
            overflow: TextOverflow.clip,
          ),
        ),
        Divider(),
        Container(
          width: _width,
          child: Text(
            "TextOverflow.fade " * 5,
            overflow: TextOverflow.fade,
          ),
        ),
        Divider(),
        Container(
          width: _width,
          child: Text(
            "TextOverflow.ellipsis " * 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Divider(),
        Container(
          width: _width,
          child: Text(
            "TextOverflow.visible " * 5,
            overflow: TextOverflow.visible,
          ),
        ),
        Divider(),
        Container(
          width: _width,
          child: Text(
            "maxLines: 2 最大行数 TextOverflow.ellipsis " * 5,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Divider(),
        Container(
          width: _width,
          child: Text(
            "textScaleFactor normal 正常显示",
          ),
        ),
        Divider(),
        Container(
          width: _width,
          child: Text(
            "textScaleFactor: 1.5 缩放1.5倍 ",
            textScaleFactor: 1.5,
          ),
        ),
        Divider(),
        Container(
          width: _width,
          child: Text(
            "TextStyle样式 ",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed
            ),
          ),
        ),
        Divider(),
        Container(
          child: Text.rich(TextSpan(
            children: [
              TextSpan(
                text: 'Flutter:'
              ),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(
                  color: Colors.blue
                ),
              )
            ]
          ))
        ),
        Divider(),
        Container(
          child: DefaultTextStyle(
            //1.设置文本默认样式
            style: TextStyle(
              color:Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text("I am Jack",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
