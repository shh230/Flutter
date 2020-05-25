import 'package:flutter/material.dart';

class BoxMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单选框和复选框'),
      ),
      body: BoxView(),
    );
  }
}

class BoxView extends StatefulWidget {
  @override
  _BoxViewState createState() => _BoxViewState();
}

class _BoxViewState extends State<BoxView> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true;//维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value) {
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}
