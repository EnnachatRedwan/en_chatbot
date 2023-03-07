import 'package:flutter/material.dart';

import './Screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ENNACHAT BOT',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Play'
      ),
      home: const ChatScreen(),
    );
  }
}
