import 'package:flutter/material.dart';
import 'package:prototype/main.dart';

class Hangman extends StatefulWidget {
  const Hangman({super.key});

  @override
  State<StatefulWidget> createState() => GamePage();
}

class GamePage extends State<MyHomePage> {

  Widget background (index) {
    return Container(
      color: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}