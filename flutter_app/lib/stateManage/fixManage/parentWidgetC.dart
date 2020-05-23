import 'package:flutter/material.dart';
import 'package:flutterapp/stateManage/fixManage/tapBoxC.dart';

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
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
        title: Text('混合状态管理'),
      ),
      body: Center(
        child: TapBoxC(
          active: _active,
          onChanged: _handleTapBoxChanged,
        ),
      ),
    );
  }
}
