import 'package:flutter/material.dart';
import 'package:retro_arcade/screens/hangman.dart';
import 'package:retro_arcade/screens/solitaire.dart';
import 'package:retro_arcade/screens/tictactoe.dart';
import 'package:retro_arcade/screens/instructions.dart';


import '../main.dart';

///Class defining the build widget that is the base of the drawer
class CommonDrawer extends StatefulWidget {
  const CommonDrawer({
    Key? key,
  }) : super(key: key);

  @override
  CommonDrawerState createState() => CommonDrawerState();
}

///Class that contains the UI of the drawer
class CommonDrawerState extends State<CommonDrawer>{
  @override
  ///Widget that holds the setup of the drawer
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 75,
            child: DrawerHeader(
              child:
              Text("Retro Arcade",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                )
              ),
            ),
          ),
          ListTile (
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyApp(),));
            },
          ),
          ListTile (
            title: const Text("Game Instructions"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Instructions(),));
            },
          ),
          const Divider(),
          const ListTile (
            title: Text("Games",
              style:
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )
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
        ],
      ),
    );
  }
}