import 'dart:async';
import 'package:flutter/material.dart';
import 'package:RetroArcade/main.dart';

class Hangman extends StatelessWidget {
  const Hangman({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hangman',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 50,
              child: const DrawerHeader(
                child: Text("Navigation"),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
              },
            )
          ]
        )
      ),
    );
  }
}

// Images for hangman
// const List<String> hangmanPics = [
//   "asset/images/Hangman1.png",
//   "asset/images/Hangman2.png",
//   "asset/images/Hangman3.png",
//   "asset/images/Hangman5.png",
//   "asset/images/Hangman5.png",
//   "asset/images/HangmanFull.png",
// ];


