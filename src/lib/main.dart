import 'package:flutter/material.dart';
import 'package:retro_arcade/screens/definition_page.dart';
import 'package:retro_arcade/screens/hangman.dart';
import 'package:retro_arcade/screens/solitaire.dart';
import 'package:retro_arcade/screens/tictactoe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retro Arcade',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

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
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DefinitionPage(),));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(// image below the top bar
              child: SizedBox(
                height: screenSize.height * 0.7,
                width: screenSize.width,
                child: Image.asset(
                  'assets/images/retroarcadelogo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    mainAxisSize:MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:const [
                      Text(
                        "Games",
                        style:
                        TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: screenSize.width / 6,
                          width: screenSize.width / 3.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(
                              'assets/images/Solitaire.gif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}