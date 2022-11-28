import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retro_arcade/main.dart';
import 'package:retro_arcade/components/commondrawer.dart';


class Solitaire extends StatelessWidget {
  const Solitaire({super.key});

  @override
  State<SolitaireGamePage> createState() => SolitaireGamePageState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SolitaireGamePage(),
    );
  }
}

class SolitaireGamePage extends StatefulWidget {
  @override
  State<SolitaireGamePage> createState() => SolitaireGamePageState();
}

class SolitaireGamePageState extends State<SolitaireGamePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  List<int> Deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  List<int> playerHand = [];
  List<int> dealerHand = [];
  int total = 0;

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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle:true,
          title: const Text(
              'BlackJack',
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              )

          )

      ),
      drawer: const CommonDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: const [
          ],
        ),
      ),
    );
  }
  void dealCard(List<int> turn){
    int card = Random(11) as int;
    card += 1;
    turn.add(card);
  }

  int Total(List<int> hand){
    total = 0;
    for(int i = 0; i < hand.length; i++){
      total += hand[i];
      if(hand[i] == 11 && total > 21){
        total -= 10;
      }
    }
    return total;
  }

  int reveal(hand){
    if(hand.length == 2){
      return hand[0];
    }
    else{
      return hand;
    }
  }

  void checkWin(){
    if(Total(playerHand) == 21){
      win();
    }
    if(Total(playerHand) == 21 && Total(dealerHand) == 21){
      push();
    }
    else if(Total(dealerHand) == 21){
      lose();
    }
    else{
      if(Total(playerHand) < 21 && Total(dealerHand) < 21){
        if(Total(playerHand) > Total(dealerHand)){
          win();
        }
        else if(Total(playerHand) < Total(dealerHand)){
          lose();
        }
        else if(Total(playerHand) == Total(dealerHand)){
          push();
        }
      }
      if(Total(playerHand) > 21){
        lose();
      }
      if(Total(dealerHand) > 21 && Total(playerHand) <= 21){
        if(Total(playerHand) == 21){
          win();
        }
        else{
          win();
        }
      }
    }
  }
  void win(){

  }

  void lose(){

  }

  void push(){

  }
}