import 'package:flutter/material.dart';
import 'listView/random_words.dart';
bool debugPrintMarkNeedsLayoutStacks = false;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第一个Flutter应用',
      home: RandomWords(),
    );
  }
}