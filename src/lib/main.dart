import 'package:flutter/material.dart';
import 'package:prototype/screens/definition_page.dart';
import 'package:prototype/screens/hangman.dart';
import 'package:prototype/screens/solitaire.dart';
import 'package:prototype/screens/tictactoe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Classic Web App Arcade',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
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
              child: DrawerHeader(
                child: Text("Games"),
              ),
            ),

            ListTile (
              title: const Text("Hangman"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Hangman(),));
              },
            ),
            ListTile (
              title: const Text("Tic-Tac-Toe"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TicTacToe(),));
              },
            ),
            ListTile (
              title: const Text("Solitaire"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Solitaire(),));
              },
            ),

            // TODO: Remove, once the backend has been properly tested.
            ListTile (
              title: const Text("*DEBUG* Definitions"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DefinitionPage(),));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container( // image below the top bar
            child: SizedBox(
              height: screenSize.height * 0.85,
              width: screenSize.width,
              child: Image.asset(
                'assets/images/wideretroarcade.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),

    );
  }
}