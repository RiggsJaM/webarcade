import 'package:flutter/material.dart';
import 'package:retro_arcade/main.dart';
import 'package:retro_arcade/components/commondrawer.dart';

class Instructions extends StatefulWidget {
  const Instructions({super.key});


  @override
  GameInstructions createState() => GameInstructions();

}

class GameInstructions extends State<Instructions> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

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
          'Instructions',
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
          children: [
          ],
        ),
      ),
    );
  }
}