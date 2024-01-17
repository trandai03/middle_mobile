import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/home_page.dart';
import './widgets/quanlyphong.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: QuanLyRoom(),

    );
  }
}

