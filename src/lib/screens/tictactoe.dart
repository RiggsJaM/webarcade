import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retro_arcade/main.dart';
import 'package:retro_arcade/components/commondrawer.dart';


class TicTacToe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  bool yourTurn = true;

  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int currentElements = 0;


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
  void _isWinner(){
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      winBox(displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      winBox(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      winBox(displayElement[6]);
    }

    // Checking Column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      winBox(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      winBox(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      winBox(displayElement[2]);
    }

    // Checking Diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      winBox(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      winBox(displayElement[2]);
    } else if (currentElements == 9) {
      drawBox();
    }
  }

  void winBox(String winner){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(" $winner is winner!"),
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

  void clearBox(){
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    currentElements = 0;
  }
}