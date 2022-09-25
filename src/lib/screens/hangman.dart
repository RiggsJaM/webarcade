import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:retro_arcade/main.dart';

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
  //Word to test if the functionality works
  String testWord = "test".toUpperCase();

  //Lives
  int lives = 0;
  List<String> chosenLetter = [];

  //The alphabet
  List<String> letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
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
      body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                manImage(lives >= 0, "assets/images/gallows.png"),
                manImage(lives >= 1, "assets/images/Hangman1.png"),
                manImage(lives >= 2, "assets/images/Hangman2.png"),
                manImage(lives >= 3, "assets/images/Hangman3.png"),
                manImage(lives >= 5, "assets/images/Hangman4.png"),
                manImage(lives >= 6, "assets/images/Hangman5.png"),
                manImage(lives >= 7, "assets/images/HangmanFull.png"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: testWord.split('').map((e) => wordLetters(e.toUpperCase(), !chosenLetter.contains(e.toUpperCase()))).toList(),
          ),
          SizedBox(
            width: screenSize.height * 0.75,
            height: screenSize.width * 0.90,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              padding: EdgeInsets.all(10.0),
              children: letters.map((e) {
                return RawMaterialButton(
                  onPressed: chosenLetter.contains(e) ? null : () {
                    setState(() {
                      chosenLetter.add(e);
                      if(!testWord.split('').contains(e.toUpperCase())) {
                        lives++;
                      }
                    });
                  },
                  shape: RoundedRectangleBorder (
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  fillColor: chosenLetter.contains(e) ? Colors.black : PageColor.otherColor,
                  child: Text (
                  e,
                  style: const TextStyle (
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
            ),
          )
        ],
      ),
    );
  }
  
  Widget manImage (bool isVisible, String filePath) {
    return Visibility(
      visible: isVisible,
      child: Container (
        width: 100,
        height: 150,
        child: Image.asset(filePath)
      )
    ); 
  }

  Widget wordLetters (String char, bool visible) {
    return Container (
      height: 75,
      width: 75,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: PageColor.otherColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Visibility(
        visible: !visible,
        child: Text(
          char,
          style: const TextStyle(
          color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}

class PageColor {
  static Color mainColor = const Color(0x00ffffff);
  static Color otherColor = const Color(0x00000000);
}

//Images for hangman
const List<String> hangmanPics = [
  "assets/images/Hangman1.png",
  "assets/images/Hangman2.png",
  "assets/images/Hangman3.png",
  "assets/images/Hangman5.png",
  "assets/images/Hangman5.png",
  "assets/images/HangmanFull.png",
  "assets/images/gallows.png",
];


