import 'package:flutter/material.dart';
import 'package:prototype/main.dart';
import 'package:prototype/screens/hangman.dart';

class Definition_Page extends StatelessWidget {
  const Definition_Page ({super.key});

  @override
  State<StatefulWidget> createState() => GamePage();

  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.deepOrange,
    );
  }
}

class GamePage extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
    throw UnimplementedError();
  }
}
