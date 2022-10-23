import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman.dart';

Future<void> iCallTheGenerateWordFunction(WidgetTester tester) async {

  GamePageState gps = GamePageState();
  List<String> myWords = gps.wordList;
  String randomWord = gps.generateWord(myWords);
  String failing = "-1";



  expect(randomWord, isNotEmpty);
  expect(randomWord != failing, true);
}
