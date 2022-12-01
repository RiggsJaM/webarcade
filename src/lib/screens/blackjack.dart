import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retro_arcade/components/commondrawer.dart';

/// Class that defines the build widget that is the base page of Blackjack
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

/// Creates the page that the Blackjack game is on
class BlackjackGamePage extends StatefulWidget {
  @override
  State<BlackjackGamePage> createState() => BlackjackGamePageState();
}

/// Class that actually contains the game in it
class BlackjackGamePageState extends State<BlackjackGamePage> {
  bool isVisible = false;

  List<playingCard> cardList = [playingCard("assets/images/Clubs/Ace_Clubs.png", "Ace_Clubs", 11),
    playingCard("assets/images/Clubs/2_Clubs.png", "2 of Clubs", 2),
    playingCard("assets/images/Clubs/3_Clubs.png", "3 of Clubs", 3),
    playingCard("assets/images/Clubs/4_Clubs.png", "4 of Clubs", 4),
    playingCard("assets/images/Clubs/5_Clubs.png", "5 of Clubs", 5),
    playingCard("assets/images/Clubs/6_Clubs.png", "6 of Clubs", 6),
    playingCard("assets/images/Clubs/7_Clubs.png", "7 of Clubs", 7),
    playingCard("assets/images/Clubs/8_Clubs.png", "8 of Clubs", 8),
    playingCard("assets/images/Clubs/9_Clubs.png", "9 of Clubs", 9),
    playingCard("assets/images/Clubs/10_Clubs.png", "10 of Clubs", 10),
    playingCard("assets/images/Clubs/Jack_Clubs.png", "Jack of Clubs", 10),
    playingCard("assets/images/Clubs/Queen_Clubs.png", "Queen of Clubs", 10),
    playingCard("assets/images/Clubs/King_Clubs.png", "King of Clubs", 10),
    playingCard("assets/images/Diamonds/Ace_Diamonds.png", "Ace of Diamonds", 11),
    playingCard("assets/images/Diamonds/2_Diamonds.png", "2 of Diamonds", 2),
    playingCard("assets/images/Diamonds/3_Diamonds.png", "3 of Diamonds", 3),
    playingCard("assets/images/Diamonds/4_Diamonds.png", "4 of Diamonds", 4),
    playingCard("assets/images/Diamonds/5_Diamonds.png", "5 of Diamonds", 5),
    playingCard("assets/images/Diamonds/6_Diamonds.png", "6 of Diamonds", 6),
    playingCard("assets/images/Diamonds/7_Diamonds.png", "7 of Diamonds", 7),
    playingCard("assets/images/Diamonds/8_Diamonds.png", "8 of Diamonds", 8),
    playingCard("assets/images/Diamonds/9_Diamonds.png", "9 of Diamonds", 9),
    playingCard("assets/images/Diamonds/10_Diamonds.png", "10 of Diamonds", 10),
    playingCard("assets/images/Diamonds/Jack_Diamonds.png", "Jack of Diamonds", 10),
    playingCard("assets/images/Diamonds/Queen_Diamonds.png", "Queen of Diamonds", 10),
    playingCard("assets/images/Diamonds/King_Diamonds.png", "King of Diamonds", 10),
    playingCard("assets/images/Hearts/Ace_Hearts.png", "Ace of Hearts", 11),
    playingCard("assets/images/Hearts/2_Hearts.png", "2 of Hearts", 2),
    playingCard("assets/images/Hearts/3_Hearts.png", "3 of Hearts", 3),
    playingCard("assets/images/Hearts/4_Hearts.png", "4 of Hearts", 4),
    playingCard("assets/images/Hearts/5_Hearts.png", "5 of Hearts", 5),
    playingCard("assets/images/Hearts/6_Hearts.png", "6 of Hearts", 6),
    playingCard("assets/images/Hearts/7_Hearts.png", "7 of Hearts", 7),
    playingCard("assets/images/Hearts/8_Hearts.png", "8 of Hearts", 8),
    playingCard("assets/images/Hearts/9_Hearts.png", "9 of Hearts", 9),
    playingCard("assets/images/Hearts/10_Hearts.png", "10 of Hearts", 10),
    playingCard("assets/images/Hearts/Jack_Hearts.png", "Jack of Hearts", 10),
    playingCard("assets/images/Hearts/Queen_Hearts.png", "Queen of Hearts", 10),
    playingCard("assets/images/Hearts/King_Hearts.png", "King of Hearts", 10),
    playingCard("assets/images/Spades/Ace_Spades.png", "Ace of Spades", 11),
    playingCard("assets/images/Spades/2_Spades.png", "2 of Spades", 2),
    playingCard("assets/images/Spades/3_Spades.png", "3 of Spades", 3),
    playingCard("assets/images/Spades/4_Spades.png", "4 of Spades", 4),
    playingCard("assets/images/Spades/5_Spades.png", "5 of Spades", 5),
    playingCard("assets/images/Spades/6_Spades.png", "6 of Spades", 6),
    playingCard("assets/images/Spades/7_Spades.png", "7 of Spades", 7),
    playingCard("assets/images/Spades/8_Spades.png", "8 of Spades", 8),
    playingCard("assets/images/Spades/9_Spades.png", "9 of Spades", 9),
    playingCard("assets/images/Spades/10_Spades.png", "10 of Spades", 10),
    playingCard("assets/images/Spades/Jack_Spades.png", "Jack of Spades", 10),
    playingCard("assets/images/Spades/Queen_Spades.png", "Queen of Spades", 10),
    playingCard("assets/images/Spades/King_Spades.png", "King of Spades", 10)];

  List<playingCard> playerHand = [];
  List<playingCard> dealerHand = [];
  //int total = 0;
  int stand = 2;

  /// This is the actual widget for everything to do with Blackjack UI
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
                'Blackjack',
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
                            addToDealer(dealerHand);
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
                            setState(() {
                              if (playerHand.length < 5) {
                                addToPlayer(playerHand);
                                displayCard(playerHand.length - 1, playerHand);
                              }
                            });
                          }
                      ),
                    ),
                    Visibility(
                        visible: isVisible,
                        child: TextButton(
                          child: const Text("Stand"),
                          onPressed: () {
                            if (dealerHand.length < 5) {
                              addToDealer(dealerHand);
                              displayCard(dealerHand.length - 1, dealerHand);
                            }
                            stand--;
                            checkWin();
                          },
                        )
                    ),
                  ]
                  )
              ),
              Column(
                children: [
                  Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Dealer",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        for(int i = 0; i < dealerHand.length; i++)
                          if(i == 1)
                            reveal(dealerHand)
                          else
                           displayCard(i, dealerHand)


                      ]
                  ),
                  Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Player",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        for(int i = 0; i < playerHand.length; i++)
                          displayCard(i, playerHand)
                      ]
                  ),
                ],
              )
            ]
        )
    );
  }

  ///Displays the image of the specific card in the given list at the provided index
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

  ///Picks random card from a deck of cards
  playingCard dealCard(List<playingCard> hand){
    int cardIndex = Random().nextInt(51);
    while(hand.contains(cardList.elementAt(cardIndex))){
      cardIndex = Random().nextInt(51);
    }
    return cardList.elementAt(cardIndex);
  }

  ///Adds the random card chosen from dealCard to the players hand
  void addToPlayer(List<playingCard> hand){
    hand.add(dealCard(hand));
    bust();
  }

  ///Decides if dealer wants hit and if they do adds a card from dealCard
  ///If they stand it decreases the stand variable so the game knows when to end
  void addToDealer(List<playingCard> dealerHand){
    if(Total(dealerHand) <= 16){
      dealerHand.add(dealCard(dealerHand));
      displayCard(dealerHand.length-1, dealerHand);
      bust();
    }
    else{
      stand--;
    }
  }

  ///Ends the game if both the dealer and the player stand
  void bothStand(){
    if (stand == 0){
      checkWin();
    }
  }

  ///Counts the points of the provided hand
  int Total(List<playingCard> hand){
    int total = 0;
      for(int i = 0; i < hand.length; i++){
        total += hand[i].points;
        if(total >= 21){
          for(int j = 0; j < hand.length; j++){
            if(hand[j].points == 11) {
              total -= 10;
            }
          }
        }
      }
      return total;
  }
  ///Decides when the dealers second card should be revealed
  Widget reveal(hand){
    if(hand.length == 2) {
      return Visibility(
          visible: true,
          child:
          Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/Card_Back.png')
          )
      );
    }
      else{
      return displayCard(1, hand);
    }
  }

  ///Given the points in the dealers and the players hand decides if there
  ///was a winner and loser or if it was a push
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
        win(Total(playerHand), Total(dealerHand));
      }
    }
  }

  ///This is the pop up box that lets the player know the game has
  ///ended when they win
  void win(int score, int oppScore){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("You are the winner!\n Dealer Points: " +
                Total(dealerHand).toString() + "\nYour Points: "
                + Total(playerHand).toString()),
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

  ///This is the pop up box that lets the player know the game has
  ///ended when they lose
  void lose(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("You lose!\nDealer Points: " +
                Total(dealerHand).toString() + "\nYour Points: "
                + Total(playerHand).toString()),
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

  ///This is the pop up box that lets the player know the game has
  ///ended when they push
  void push(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("You pushed!\n  Dealer Points: " +
                Total(dealerHand).toString() + "\nYour Points: "
                + Total(playerHand).toString()),
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

  ///Ends the game if either the dealer or the player bust
  void bust() {
    if (Total(playerHand) > 21 || Total(dealerHand) > 21) {
      checkWin();
    }
  }

  ///Clears all the hands and other variable to play another hand
  void clearTable(){
    setState(() {
      playerHand = [];
      dealerHand = [];
      stand = 2;
      isVisible = false;
    });
  }

}

///Class holding the card objects
class playingCard{
  final String image;
  final String name;
  int points;
  playingCard(this.image, this.name, this.points);
}