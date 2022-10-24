import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman_debug.dart';
import 'package:retro_arcade/screens/hangman.dart';

void main() {
  testWidgets("You Lose The Game", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    GamePageDebugState.lives = 5;
    await tester.pumpAndSettle();
    await tester.tap(find.text('D'));
    await tester.pumpAndSettle();

    expect(find.text("You Lose", skipOffstage: false), findsOneWidget);
  });

  testWidgets("You Lose The Game", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    GamePageState.lives = 5;
    await tester.pumpAndSettle();
    await tester.tap(find.text('D'));
    await tester.pumpAndSettle();

    expect(find.text("You Lose", skipOffstage: false), findsOneWidget);
  });
}