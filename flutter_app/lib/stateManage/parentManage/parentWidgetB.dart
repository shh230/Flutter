import 'package:flutter/material.dart';
import 'package:flutterapp/stateManage/parentManage/TapBoxB.dart';

class ParentWidgetB extends StatefulWidget {
  @override
  _ParentWidgetBState createState() => _ParentWidgetBState();
}

class _ParentWidgetBState extends State<ParentWidgetB> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('父类状态管理'),
      ),
      body: Center(
        child: TapBoxB(
          active: _active,
          onChanged: _handleTapBoxChanged,
        ),
      ),
    );
  }
}
