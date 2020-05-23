import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

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
    return Center(
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              _active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600]
          ),
        ),
      ),
    );
  }
}
