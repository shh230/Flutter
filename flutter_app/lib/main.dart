import 'package:flutter/material.dart';
import 'main/main_listview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第一个Flutter应用',
      home: MainListView(),
    );
  }
}