import 'package:flutter/material.dart';
import 'package:retro_arcade/components/commondrawer.dart';

/// Class that defines the build widget that is the base page of Tic-Tac-Toe
class TicTacToe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// Creates the page that the Tic-Tac-Toe game is on
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

/// Class that actually has the game in it
class _HomePageState extends State<HomePage>{
  bool yourTurn = true;

  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int currentElements = 0;
  bool draw = true;

/// This is the actual widget for everything to do with Tic-Tac-Toe
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
            'Tic-Tac-Toe',
            style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        drawer: CommonDrawer(),
        body: Expanded(
            flex: 4,
            // This makes the actual board for the game
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.0,
                ),
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Center(
                        child: Text(
                          displayElement[index],
                          style: const TextStyle(color: Colors.white, fontSize: 150 ),
                        ),
                      ),
                    ),
                  );
                }
            )
        )
    );
  }

  /// This is the method to check which space you type
  void tapped(int index){
    setState(() {
      if(yourTurn && displayElement[index] == ''){
        displayElement[index] = 'X';
        currentElements++;
      }
      else if (!yourTurn && displayElement[index] == ''){
        displayElement[index] = 'O';
        currentElements++;
      }

      yourTurn = !yourTurn;
      _isWinner();
    });
  }

  /// Method that checks if you win and who wins, or draws
  void _isWinner(){
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      currentElements = 0;
      winBox(displayElement[0]);
    }
    else if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      currentElements = 0;
      winBox(displayElement[3]);
    }
    else if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      currentElements = 0;
      winBox(displayElement[6]);
    }

    // Checking Column
    else if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      currentElements = 0;
      winBox(displayElement[0]);
    }
    else if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      currentElements = 0;
      winBox(displayElement[1]);
    }
    else if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      currentElements = 0;
      winBox(displayElement[2]);
    }

    // Checking Diagonal
    else if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      currentElements = 0;
      winBox(displayElement[0]);
    }
    else if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      currentElements = 0;
      winBox(displayElement[2]);
    }
    else if (currentElements == 9) {
      currentElements = 0;
      drawBox();
    }
  }

  /// This pops up the actual dialog box for winning
  void winBox(String winner){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("$winner is winner!"),
            actions: <Widget>[
              TextButton(
                child: const Text("Play again"),
                onPressed: (){
                  clearBox();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  /// This displays the draw box in case of a draw
  void drawBox(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: <Widget>[
              TextButton(
                child: const Text("Play again"),
                onPressed: (){
                  clearBox();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  /// This just clears the grid for Tic-Tac-Toe
  void clearBox(){
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    currentElements = 0;
  }
}