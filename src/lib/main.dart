import 'package:flutter/material.dart';
import 'package:retro_arcade/screens/hangman.dart';
import 'package:retro_arcade/screens/blackjack.dart';
import 'package:retro_arcade/screens/tictactoe.dart';
import 'package:retro_arcade/components/commondrawer.dart';

void main() {
  runApp(MyApp());
}

///Class defining the build widget that is the base of the home page
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

///Class that creates the page that the home page is on
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

///Class that contains the main page UI
class _HomePageState extends State<HomePage> {

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  ///Function that allows you to be able to scroll if needed on this screen
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
  ///Widget that holds the setup of the home page
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
      drawer: CommonDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.7,
              width: screenSize.width,
              child: Image.asset(
                'assets/images/retroarcadelogo.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 10.0),
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
                    Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Blackjack(),));
                            },
                            child: SizedBox(
                              height: screenSize.width / 6,
                              width: screenSize.width / 3.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/images/Solitaire.gif',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: screenSize.height / 70,
                            top: 10.0,
                          ),
                          child: const Text(
                            "Blackjack",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                    Expanded (
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Hangman(),));
                            },
                            child: SizedBox(
                              height: screenSize.width / 6,
                              width: screenSize.width / 3.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/images/Hanman.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: screenSize.height / 70,
                            top: 10.0,
                          ),
                          child: const Text(
                            "Hangman",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(26.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TicTacToe(),));
                              },
                              child: SizedBox(
                                height: screenSize.width / 6,
                                width: screenSize.width / 3.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    'assets/images/Tic-Tac-Toe.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: screenSize.height / 70,
                              top: 10.0,
                            ),
                            child: const Text(
                              "Tic-Tac-Toe",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
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