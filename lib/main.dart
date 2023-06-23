import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hufsummer_hackathon/screens/input_page.dart';
import 'Data/naver_map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
