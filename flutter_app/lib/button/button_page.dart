import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
      ),
      body: _buildView(context),
    );
  }

  Widget _buildView(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: RaisedButton(
            child: Text('RaisedButton'),
            onPressed: () => print('RaisedButton'),
          ),
        ),
        Container(
          child: FlatButton(
            child: Text('FlatButton'),
            onPressed: () => print('FlatButton'),
          ),
        ),
        Container(
          child: OutlineButton(
            child: Text('OutlineButton'),
            onPressed: () => print('OutlineButton'),
          ),
        ),
        Container(
          child: IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => print('IconButton'),
          ),
        ),
        Divider(),
        Container(
          child: Text(
            '带图标的按钮',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.all(20),
          child: RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text('RaisedButton'),
            onPressed: () => print('RaisedButton'),
          ),
        ),
        Container(
          child: FlatButton.icon(
            icon: Icon(Icons.add),
            label: Text('FlatButton'),
            onPressed: () => print('FlatButton'),
          ),
        ),
        Container(
          child: OutlineButton.icon(
            icon: Icon(Icons.info),
            label: Text('OutlineButton'),
            onPressed: () => print('OutlineButton'),
          ),
        ),
        Divider(),
        Container(
          child: Text(
            '自定义按钮',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Divider(),
        Container(
          child: RaisedButton(
            child: Text('FlatButton'),
            textColor: Colors.white,
            color: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            highlightColor: Colors.blue[700],
            splashColor: Colors.grey,
            onPressed: () => print('FlatButton'),
          ),
        ),
      ],
    );
  }
}
