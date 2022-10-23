import 'package:flutter/material.dart';
import 'package:retro_arcade/main.dart';
import 'package:retro_arcade/components/commondrawer.dart';


///Class that defines the build widget that is basis of the Hangman page
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

///The page that Hangman takes place on
class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => GamePageState();
}

///Class that holds the functionality and UI for the Hangman game separated into widgets.
class GamePageState extends State<GamePage> {
  //Word to test if the functionality works
  static String testWord = "test".toUpperCase();

  //List that contains each letter chosen that is in the word to be guessed
  List<String> completeWord = [];

  //Lives
  static int lives = 0;

  //List that holds the chosen letters
  List<String> chosenLetter = [];

  //List that holds the alphabet
  List<String> letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];



  List<String> wordList = ["quilt","train","plant","river","table","chair","book","lamp","door","window","stove","fridge","computer","phone","TV","car","bike","skate","cactus","bus","taxi","van","truck","cord","plug","outlet","sink","faucet","mirror","toilet","bath","shower","tile","carpet","rug","sofa","love","seat","chest","box","ball","toy","cup","dish","fork","knife","spoon","pan","pot","oven"];
  // function to generate a random word from the list above

  String generateWord(List<String> word_list)
  {
    return "-1";
  }


  ///Widget that creates most of the functionality and visual elements of the Hangman game
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle:true,
        title: const Text(
          'Hangman',
          style: TextStyle(
            fontSize:20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      drawer: CommonDrawer(),
      body:
          //Column that holds the Hangman keyboard, word, and images that are shown
          Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                          "assets/images/gallows.png",
                          height: 325,
                          width: 225,
                      ),
                    ),
                    Positioned(
                        top: 33,
                        left: 70,
                        child: Container(
                          child: Stack(
                            children: [
                              manImage(lives >= 1, "assets/images/Hangman1.png"),
                              manImage(lives >= 2, "assets/images/Hangman2.png"),
                              manImage(lives >= 3, "assets/images/Hangman3.png"),
                              manImage(lives >= 4, "assets/images/Hangman4.png"),
                              manImage(lives >= 5, "assets/images/Hangman5.png"),
                              manImage(lives >= 6, "assets/images/HangmanFull.png"),
                            ]
                          )
                      )
                    )
                  ],
                ),
              ),
              //Row that holds the boxes where the guessed letters that are in the word will go
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: testWord.split('').map((e) => wordLetters(e.toUpperCase(), !chosenLetter.contains(e.toUpperCase()))).toList(),
              ),
              Expanded(
              //SizedBox that holds the keyboard
              child: SizedBox(
                  width: screenSize.height * 0.75,
                  height: screenSize.width * 0.90,
                  child: GridView.count(
                    crossAxisCount: 7,
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                    padding: EdgeInsets.all(10.0),
                    children: letters.map((e) {
                      //Button that holds the functionality that determines if a guess is right or wrong, and whether the user has won or lost
                      // return ElevatedButton (
                      //   onPressed: chosenLetter.contains(e) ? null : () {
                      //     setState(() {
                      //       chosenLetter.add(e);
                      //       //The letter guessed is wrong
                      //       if(!testWord.split('').contains(e.toUpperCase())) {
                      //         lives++;
                      //       }
                      //       //Defeat condition
                      //       if (lives >= 6) {
                      //         showDialog(context: context, builder: (BuildContext context) => youLose());
                      //       }
                      //       //Victory condition
                      //       if(testWord.toUpperCase().contains(e.toUpperCase())) {
                      //         completeWord.add(e);
                      //         if (completeWord.toSet().containsAll(testWord.split('').toSet())) {
                      //           showDialog(context: context, builder: (BuildContext context) => youWin());
                      //         }
                      //       }
                      //     });
                      //   },
                      //     //Specifying how the keyboard "keys" will look and to change their color when pressed
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: chosenLetter.contains(e) ? Colors.black : Colors.purpleAccent,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(5.0),
                      //     )),
                      //     child: Text (
                      //       e,
                      //       style: const TextStyle (
                      //         color: Colors.white,
                      //         fontSize: 30,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //   ));
                      return RawMaterialButton(
                        onPressed: chosenLetter.contains(e) ? null : () {
                          setState(() {
                            chosenLetter.add(e);
                            //The letter guessed is wrong
                            if(!testWord.split('').contains(e.toUpperCase())) {
                              lives++;
                            }
                            //Defeat condition
                            if (lives >= 6) {
                              showDialog(context: context, builder: (BuildContext context) => youLose());
                            }
                            //Victory condition
                            if(testWord.toUpperCase().contains(e.toUpperCase())) {
                              completeWord.add(e);
                              if (completeWord.toSet().containsAll(testWord.split('').toSet())) {
                                showDialog(context: context, builder: (BuildContext context) => youWin());
                              }
                            }
                          });
                        },
                        //Specifying how the keyboard "keys" will look
                        shape: RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        fillColor: chosenLetter.contains(e) ? Colors.black : Colors.purpleAccent,
                        child: Text (
                          e,
                          style: const TextStyle (
                            color: Colors.white,
                            fontSize: 30,
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

  ///Widget that holds the functionality for when the user loses the game
  Widget youLose() {
    //Alert box to pop up when lives >= 6
    //Will not dismiss itself, must be clicked outside of the alert box to dismiss
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
        //Button that takes the user to a new game of Hangman
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
        //Button that takes the user to the home page
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

  ///Widget that holds the functionality for when the user wins the game
  Widget youWin() {
    //Alert box to pop up when the victory condition has been reached
    //Will not dismiss itself, must be clicked outside of the alert box to dismiss
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
        //Button that takes the user to a new game of Hangman
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
        //Button that takes the user to the home page
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

  ///Widget that controls whether an image on the screen is visible or not
  Widget manImage (bool isVisible, String filePath) {
    return Visibility(
      visible: isVisible,
      child: Container (
        width: 100,
        height: 200,
        child: Image.asset(filePath)
      )
    ); 
  }

  ///Widget that creates the boxes for the letters in the word to be guessed and controls whether the letter is visible or not in the box
  Widget wordLetters (String char, bool visible) {
    return Container (
      height: 75,
      width: 75,
      padding: const EdgeInsets.fromLTRB(21.0, 7.0, 0, 10.0),
      //MARGIN BREAKS ALL THE TESTS
      //margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.cyanAccent),
        borderRadius: BorderRadius.circular(5.0),
      ),
      //Controlling the visibility of each letter in the box
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


