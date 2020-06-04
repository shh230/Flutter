import 'package:flutter/material.dart';
import 'package:wechat_demo/styles/styles.dart';

class IndexBar extends StatefulWidget {
  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  Color _bkColor = Color.fromRGBO(1, 1, 1, 0);
  Color _textColor = Color.fromRGBO(86, 90, 90, 1);

  double _indicatorY = 0.0; // 气泡偏移量
  String _indicatorText = 'A'; // 气泡展示的文字
  bool _indicatorHidden = true; // 气泡是否隐藏

  @override
  Widget build(BuildContext context) {
    List<Widget> _wordsViews = [];

    /// 处理数据,将字母处理成 widget
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      _wordsViews.add(Expanded(
        child: Text(
          INDEX_WORDS[i],
          style: TextStyle(fontSize: 12, color: _textColor),
        ),
      ));
    }

    return Positioned(
      right: 0,
      top: ScreenHeight(context) / 8,
      height: ScreenHeight(context) / 2,
      width: 120,
      child: Row(
        children: [
          Container(
            alignment: Alignment(0, _indicatorY),
            width: 100,
            color: Colors.grey,
            child: Stack(
              alignment: Alignment(-0.2, 0),
              children: [
                Image(
                  image: AssetImage('images/气泡.png'),
                  width: 60,
                ),
                Text(
                  _indicatorText,
                  style: TextStyle(fontSize: 35, color: Colors.white),
                )
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              width: 20,
              child: Column(
                children: _wordsViews,
              ),
            ),
            onVerticalDragUpdate: (DragUpdateDetails details) {
              int index = getIndex(context, details.globalPosition);
              print(2.18 / 28 * index - 1.09);
              setState(() {
                _bkColor = Colors.green;
                _indicatorText = INDEX_WORDS[index];
                _indicatorY = 2.18 / 28 * index - 1.09;
              });
            },
            onVerticalDragDown: (DragDownDetails details) {
              int index = getIndex(context, details.globalPosition);
              print(2.18 / 28 * index - 1.09);
              setState(() {
                _bkColor = Colors.green;
                _indicatorText = INDEX_WORDS[index];
                _indicatorHidden = false;
                _indicatorY = 2.18 / 28 * index - 1.09;
              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                _bkColor = Colors.green;
                _indicatorHidden = true;
              });
            },
          )
        ],
      ),
    );
  }
}

int getIndex(BuildContext context, Offset globalPosition) {
  // 获取当前视图
  RenderBox box = context.findRenderObject();
  // 获取y坐标
  double y = box.globalToLocal(globalPosition).dy;
  int wordsLength = INDEX_WORDS.length;
  // 算出字符高度
  var itemHeight = ScreenHeight(context) / 2 / wordsLength;
  // 算出是第几个item，并且给去一个取值范围
  int index = (y ~/ itemHeight).clamp(0, wordsLength - 1);
  return index;
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
