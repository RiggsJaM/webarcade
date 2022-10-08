import 'package:flutter/material.dart';
import 'package:retro_arcade/main.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tic-tac-toe',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GamePage(),
    );
  }
}

class GamePage extends StatelessWidget{
  int win = 0;

  GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/NicNacNoe.png"
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(350, 250, 0.0, 80),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 250, 0.0, 80),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 250, 0.0, 80),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(350, 0, 0.0, 75),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 0, 0.0, 75),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 0.0, 0.0, 75),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(350, 0, 0.0, 75),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 0, 0.0, 75),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 0.0, 0.0, 75),
                  child: SizedBox(
                    height: screenSize.height / 16,
                    width: screenSize.width / 16,
                    child: Image.asset(
                        "assets/images/NicNacNoe.png"
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}