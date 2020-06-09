import 'package:flutter/material.dart';
import 'main/main_listview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      home: MainListView(),
      theme: ThemeData(
        primaryColor: Colors.red
      ),
    );
  }
}