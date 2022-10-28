import 'package:flutter/material.dart';
import 'package:retro_arcade/components/commondrawer.dart';

class Instructions extends StatefulWidget {
  const Instructions({super.key});


  @override
  GameInstructions createState() => GameInstructions();

}

class GameInstructions extends State<Instructions> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle:true,
        title: const Text(
          'Instructions',
          style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.w400,
          ),
        ),
      ),
      drawer: const CommonDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: const [
                Text("Hangman",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("The goal of hangman is to guess the word that has been "
                    "randomly chosen before the whole stick man appears and is "
                    "hung. "
                    "When you open hangman it will display a number of"
                    " blank boxes. The number of blank boxes is the number of"
                    " letters in the word you are trying to guess.\n You will "
                    "start by selecting a letter on the screen that you think "
                    "is in the unknown word. If the letter is in the word then "
                    "it will appear in the box or boxes where it would appear "
                    "in the word. If the letter is not in the word then a part "
                    "of the stick man will appear on the screen. You will "
                    "continue guessing until you figure out the word or the "
                    "whole stick man has appeared.\n If you figure out the word "
                    "you have won. If the stick man was hung you lost. Once you"
                    " finish the game it will tell if you won or loss and what "
                    "the word was along with the definition. You will have the "
                    "option to play again guessing a different word or go back "
                    "to the home page to play a different game. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Tic-Tac-Toe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                 ),
                Text("The goal is Tic-Tac-Toe is to be the first player to get "
                    "your pieces three in a row, either vertically, "
                    "horizontally, or diagonally, while preventing your opponent"
                    " from getting three of their pieces in a row.\n"
                    "This Tic-Tac-Toe is a two-player game, so whoever wants to"
                    " go first will click in the box they want to place their "
                    "first piece in. Then the second player will do the same "
                    "picking any empty box to place their piece. The players "
                    "will continue alternating turns until someone wins, with "
                    "three pieces in a row or there is a draw, which means "
                    "there is no way for either player to win.\n When the game"
                    " is over it will tell you who won and then allow you to "
                    "play again.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Solitaire",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text("",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),

        ),
      );
  }
}