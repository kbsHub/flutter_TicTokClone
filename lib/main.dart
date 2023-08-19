import 'package:flutter/material.dart';

void main() {
  runApp(const TicTokApp());
}

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTokClone',
      theme: ThemeData(primaryColor: const Color(0XFFE9435A)),
      home: Container(),
    );
  }
}
