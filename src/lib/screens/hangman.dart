import 'package:flutter/foundation.dart';
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
  static String testWord = "test".toUpperCase();

  List<String> completeWord = [];

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: testWord.split('').map((e) => wordLetters(e.toUpperCase(), !chosenLetter.contains(e.toUpperCase()))).toList(),
          ),
          Expanded(
            child: SizedBox(
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
                        print("Chosen Letter");
                        if(!testWord.split('').contains(e.toUpperCase())) {
                          lives++;
                        }
                        if (lives >= 6) {
                          showDialog(context: context, builder: (BuildContext context) => youLose());
                        }
                        if(testWord.toUpperCase().contains(e.toUpperCase())) {
                          completeWord.add(e);
                          if (completeWord.toSet().containsAll(testWord.split('').toSet())) {
                            showDialog(context: context, builder: (BuildContext context) => youWin());
                          }
                        }
                      });
                    },
                    shape: RoundedRectangleBorder (
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fillColor: chosenLetter.contains(e) ? Colors.black : Colors.purpleAccent,
                    child: Text (
                      e,
                      style: const TextStyle (
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
              }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget youLose() {
    return AlertDialog(
      title: const Text("You're Lousy"),
      content: Column (
          mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("You Lose")
        ],
        ),
      actions: <Widget>[
        RawMaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Hangman(),));
              },
            child: const Text("New Game",
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        RawMaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage(),));
          },
          child: const Text("Home Page",
            style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        ],
      );
  }

  Widget youWin() {
    return AlertDialog(
      title: const Text("You're Amazing"),
      content: Column (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("You Win")
        ],
      ),
      actions: <Widget>[
        RawMaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Hangman(),));
          },
          child: const Text("New Game",
            style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage(),));
          },
          child: const Text("Home Page",
            style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
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
      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0, 10.0),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.cyanAccent),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Visibility(
        visible: !visible,
        child: Text(
          char,
          style: const TextStyle(
          color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 50.0,
          ),
        ),
      ),
    );
  }
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


