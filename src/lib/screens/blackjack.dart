import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retro_arcade/main.dart';
import 'package:retro_arcade/components/commondrawer.dart';


class Blackjack extends StatelessWidget {
  const Blackjack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlackjackGamePage(),
    );
  }
}

class BlackjackGamePage extends StatefulWidget {
  @override
  State<BlackjackGamePage> createState() => BlackjackGamePageState();
}

class BlackjackGamePageState extends State<BlackjackGamePage> {
  bool isVisible = false;

  List<int> Deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  final List<playingCard> cardList = [playingCard("assets/images/Clubs/Ace_Clubs.png", "Ace_Clubs", 11),
    playingCard("assets/images/Clubs/2_Clubs.png", "2_Clubs", 2),
    playingCard("assets/images/Clubs/3_Clubs.png", "3_Clubs", 3),
    playingCard("assets/images/Clubs/4_Clubs.png", "4_Clubs", 4),
    playingCard("assets/images/Clubs/5_Clubs.png", "5_Clubs", 5),
    playingCard("assets/images/Clubs/6_Clubs.png", "6_Clubs", 6),
    playingCard("assets/images/Clubs/7_Clubs.png", "7_Clubs", 7),
    playingCard("assets/images/Clubs/8_Clubs.png", "8_Clubs", 8),
    playingCard("assets/images/Clubs/9_Clubs.png", "9_Clubs", 9),
    playingCard("assets/images/Clubs/10_Clubs.png", "10_Clubs", 10),
    playingCard("assets/images/Clubs/Jack_Clubs.png", "Jack_Clubs", 10),
    playingCard("assets/images/Clubs/Queen_Clubs.png", "Queen_Clubs", 10),
    playingCard("assets/images/Clubs/King_Clubs.png", "King_Clubs", 10),
    playingCard("assets/images/Diamonds/Ace_Diamonds.png", "Ace_Diamonds", 11),
    playingCard("assets/images/Diamonds/2_Diamonds.png", "2_Diamonds", 2),
    playingCard("assets/images/Diamonds/3_Diamonds.png", "3_Diamonds", 3),
    playingCard("assets/images/Diamonds/4_Diamonds.png", "4_Diamonds", 4),
    playingCard("assets/images/Diamonds/5_Diamonds.png", "5_Diamonds", 5),
    playingCard("assets/images/Diamonds/6_Diamonds.png", "6_Diamonds", 6),
    playingCard("assets/images/Diamonds/7_Diamonds.png", "7_Diamonds", 7),
    playingCard("assets/images/Diamonds/8_Diamonds.png", "8_Diamonds", 8),
    playingCard("assets/images/Diamonds/9_Diamonds.png", "9_Diamonds", 9),
    playingCard("assets/images/Diamonds/10_Diamonds.png", "10_Diamonds", 10),
    playingCard("assets/images/Diamonds/Jack_Diamonds.png", "Jack_Diamonds", 10),
    playingCard("assets/images/Diamonds/Queen_Diamonds.png", "Queen_Diamonds", 10),
    playingCard("assets/images/Diamonds/King_Diamonds.png", "King_Diamonds", 10),
    playingCard("assets/images/Hearts/Ace_Hearts.png", "Ace_Hearts", 11),
    playingCard("assets/images/Hearts/2_Hearts.png", "2_Hearts", 2),
    playingCard("assets/images/Hearts/3_Hearts.png", "3_Hearts", 3),
    playingCard("assets/images/Hearts/4_Hearts.png", "4_Hearts", 4),
    playingCard("assets/images/Hearts/5_Hearts.png", "5_Hearts", 5),
    playingCard("assets/images/Hearts/6_Hearts.png", "6_Hearts", 6),
    playingCard("assets/images/Hearts/7_Hearts.png", "7_Hearts", 7),
    playingCard("assets/images/Hearts/8_Hearts.png", "8_Hearts", 8),
    playingCard("assets/images/Hearts/9_Hearts.png", "9_Hearts", 9),
    playingCard("assets/images/Hearts/10_Hearts.png", "10_Hearts", 10),
    playingCard("assets/images/Hearts/Jack_Hearts.png", "Jack_Hearts", 10),
    playingCard("assets/images/Hearts/Queen_Hearts.png", "Queen_Hearts", 10),
    playingCard("assets/images/Hearts/King_Hearts.png", "King_Hearts", 10),
    playingCard("assets/images/Spades/Ace_Spades.png", "Ace_Spades", 11),
    playingCard("assets/images/Spades/2_Spades.png", "2_Spades", 2),
    playingCard("assets/images/Spades/3_Spades.png", "3_Spades", 3),
    playingCard("assets/images/Spades/4_Spades.png", "4_Spades", 4),
    playingCard("assets/images/Spades/5_Spades.png", "5_Spades", 5),
    playingCard("assets/images/Spades/6_Spades.png", "6_Spades", 6),
    playingCard("assets/images/Spades/7_Spades.png", "7_Spades", 7),
    playingCard("assets/images/Spades/8_Spades.png", "8_Spades", 8),
    playingCard("assets/images/Spades/9_Spades.png", "9_Spades", 9),
    playingCard("assets/images/Spades/10_Spades.png", "10_Spades", 10),
    playingCard("assets/images/Spades/Jack_Spades.png", "Jack_Spades", 10),
    playingCard("assets/images/Spades/Queen_Spades.png", "Queen_Spades", 10),
    playingCard("assets/images/Spades/King_Spades.png", "King_Spades", 10)];

  List<playingCard> playerHand = [playingCard("assets/images/Card_Back.png", "", 0)];
  List<playingCard> dealerHand = [];
  int total = 0;
  int stand = 2;


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
              'BlackJack',
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              )
          )
      ),
      drawer: const CommonDrawer(),
      body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100.0, 0.0, 0.0),
              child: Row(children:[
                TextButton(
                  child: const Text("Start"),
                  onPressed: (){
                    setState(() {
                      clearTable();
                      for(int startingDeal = 0; startingDeal < 2; startingDeal++){
                        addToPlayer(playerHand);
                        displayCard(startingDeal, playerHand);
                        addToDealer(dealerHand);
                        displayCard(startingDeal, dealerHand);
                      }
                      isVisible = !isVisible;

                    });

                  },
                ),
                Visibility(
                  visible: isVisible,
                  child: TextButton (
                      child: const Text("Hit"),
                      onPressed: () {
                        addToPlayer(playerHand);
                        displayCard(playerHand.length--, playerHand);
                      }
                  ),
                ),

                Visibility(
                  visible: isVisible,
                  child: TextButton(
                    child: const Text("Stand"),
                    onPressed: (){
                      stand--;
                    },
                  )
                ),

              ]
              )

            ),
            Row(
              children: [
                for(int i = 0; i < playerHand.length; i++)
                  displayCard(i, playerHand)
              ]
              ),
          ]
        )
    );
  }
  Widget displayCard(int cardNumber, List<playingCard> hand){
    return Visibility(
      visible: true,
      child:
        Container(
          height:150,
          width:150,
          child: Image.asset(hand[cardNumber].image)
        )
    );
  }

  playingCard dealCard(List<playingCard> hand){
    playingCard turn;
    int cardIndex = Random().nextInt(51);
    while(hand.contains(cardList.elementAt(cardIndex))){
      cardIndex = Random().nextInt(51);
    }
    return turn = cardList.elementAt(cardIndex);
  }

  void addToPlayer(List<playingCard> hand){
    hand.add(dealCard(hand));
    // displayCard(hand.length--, hand);
  }

  void addToDealer(List<playingCard> dealerHand){
    if(Total(dealerHand) <= 16){
      dealerHand.add(dealCard(dealerHand));
    }
    else{
      stand--;
    }
  }

  void bothStand(){
    if (stand == 0){
      checkWin();
    }
  }

  int Total(List<playingCard> hand){
    total = 0;
    for(int i = 0; i < hand.length; i++){
      total += hand[i].points;
      if(hand[i].points == 11 && total > 21){
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
      win(Total(playerHand), Total(dealerHand));
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
          win(Total(playerHand), Total(dealerHand));
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
        // if(Total(playerHand) == 21){
        //   win(Total(playerHand), Total(dealerHand));
        // }
        // else{
          win(Total(playerHand), Total(dealerHand));
        //}
      }
    }
  }
  void win(int score, int oppScore){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("You are the winner!"),
            actions: <Widget>[
              TextButton(
                child: const Text("Play again"),
                onPressed: (){
                  Navigator.of(context).pop();
                  clearTable();
                },
              )
            ],
          );
        }
    );
  }

  void lose(){

  }

  void push(){

  }

  void clearTable(){
    setState(() {
      playerHand = [];
      dealerHand = [];
      stand = 2;
    });
  }

}

class playingCard{
  final String image;
  final String name;
  final int points;
  playingCard(this.image, this.name, this.points);
}
