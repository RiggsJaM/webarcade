import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman.dart';
import 'i_call_the_generate_word_function.dart';

Future<void> theGenerateWordFunctionReturnsAWordFromTheWordlist(WidgetTester tester) async {

  // For this one we need the list, and we will compare simply
  // Whether the string generated is an item in that list:


  GamePageState gps = GamePageState();

  List<String> myWords = gps.wordList;


  String myWord = gps.generateWord(myWords);

  bool isInList = false;

  if (myWord.isNotEmpty)
  {
    // Check to see if my word is in the list
    isInList = myWords.contains(myWord);
  }

  expect(isInList, true);
}