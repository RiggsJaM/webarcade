// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../features/step/the_hangman_page_is_running.dart';
import '../features/step/i_call_the_generate_word_function.dart';
import '../features/step/the_generate_word_function_returns_a_word_from_the_wordlist.dart';

void main() {
  group('''SeedRandomWordInHangman''', () {
    testWidgets('''Generate a random word from the word list''', (tester) async {
      await theHangmanPageIsRunning(tester);
      await iCallTheGenerateWordFunction(tester);
      await theGenerateWordFunctionReturnsAWordFromTheWordlist(tester);
    });
  });
}
