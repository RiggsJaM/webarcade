import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman.dart';

void main() {
  testWidgets("Correct Guess Does Not Increases Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new Hangman());
    await tester.ensureVisible(find.text('E'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('E'));
    await tester.pumpAndSettle();

    expect(GamePageState.lives, 0);
  });
}