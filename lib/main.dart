import 'package:flutter/material.dart';
import 'package:project/widgets/home_page.dart';
import "package:provider/provider.dart";

import './modules/room.dart';
import './modules/user_interface.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserInterface()),
        ChangeNotifierProvider(create: (context) => RoomProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
