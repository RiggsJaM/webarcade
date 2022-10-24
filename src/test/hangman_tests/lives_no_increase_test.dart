import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman_debug.dart';

void main() {
  testWidgets("Correct Guess Does Not Increases Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('E'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('E'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 0);
  });

  testWidgets("2 Correct Guesses Does Not Increase Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('S'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('S'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 0);
  });

  testWidgets("3 Correct Guesses Does Not Increase Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('T'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('T'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 0);
  });
}