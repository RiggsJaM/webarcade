import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman_debug.dart';

void main() {
  testWidgets("Wrong Guess Increases Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Z'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 1);
    expect(find.text('Z'), findsOneWidget);
  });

  testWidgets("2 Wrong Guesses Increase Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Z'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 2);
    expect(find.text('Z'), findsOneWidget);
  });

  testWidgets("3 Wrong Guesses Increase Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Z'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 3);
    expect(find.text('Z'), findsOneWidget);
  });

  testWidgets("4 Wrong Guesses Increase Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Z'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 4);
    expect(find.text('Z'), findsOneWidget);
  });

  testWidgets("5 Wrong Guesses Increase Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Z'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 5);
    expect(find.text('Z'), findsOneWidget);
  });

  testWidgets("6 Wrong Guess Increase Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Z'));
    await tester.pumpAndSettle();

    expect(GamePageDebugState.lives, 6);
    expect(find.text('Z'), findsOneWidget);
  });
}