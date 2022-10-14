import 'package:flutter/material.dart';
import 'package:retro_arcade/screens/hangman.dart';
import 'package:retro_arcade/screens/new_definition_page.dart';
import 'package:retro_arcade/screens/solitaire.dart';
import 'package:retro_arcade/screens/tests_page.dart';
import 'package:retro_arcade/screens/tictactoe.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({
    Key? key,
  }) : super(key: key);

  @override
  CommonDrawerState createState() => CommonDrawerState();
}

class CommonDrawerState extends State<CommonDrawer>{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 50,
            child: DrawerHeader(
              child: Text("Games"),
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

          // TODO: Remove, once the backend has been properly tested.
          ListTile (
            title: const Text("*DEBUG* Definitions"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyDefinitionPage(),));
            },
          ),
          ListTile (
            title: const Text("Gherkin Tests"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GherkinTestsPage(title: "Gherkin Tests"),));
            },
          ),
        ],
      ),
    );
  }
}