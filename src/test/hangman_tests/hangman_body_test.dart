import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman_debug.dart';
import 'package:retro_arcade/screens/hangman.dart';

/// running flutter test test/hangman_tests/ in the src directory will run all tests in that folder
void main() {
  // The tests after this will not pass without this test first.
  // I do not understand it either.
  testWidgets("Test That's Here To Make The Others Work", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.ensureVisible(find.text('Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Z'));

    GamePageState gps = GamePageState();
    expect(find.text('Z'), findsOneWidget);
  });

  testWidgets("Gallows shows up on the page", (WidgetTester tester) async {
      await tester.pumpWidget(new HangmanDebug());
      await tester.pumpAndSettle();

    expect(find.image(const AssetImage("assets/images/gallows.png")), findsOneWidget);
  });

  testWidgets("Head shows up on the page", (WidgetTester tester) async {
      await tester.pumpWidget(new HangmanDebug());
      //await tester.pumpAndSettle();
      await tester.tap(find.text('Z'));
      //await tester.pumpAndSettle();

    expect(find.image(const AssetImage("assets/images/Hangman1.png")), findsOneWidget);
  });

  testWidgets("Body shows up on the page", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();

    expect(find.image(const AssetImage("assets/images/Hangman2.png")), findsOneWidget);
  });

  testWidgets("Left Leg shows up on the page", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();

    expect(find.image(const AssetImage("assets/images/Hangman3.png")), findsOneWidget);
  });

  testWidgets("Right Leg shows up on the page", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();

    expect(find.image(const AssetImage("assets/images/Hangman4.png")), findsOneWidget);
  });

  testWidgets("Left Arm shows up on the page", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();

    expect(find.image(const AssetImage("assets/images/Hangman5.png")), findsOneWidget);
  });

  testWidgets("Right Arm shows up on the page", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('G'));
    await tester.pumpAndSettle();

    expect(find.image(const AssetImage("assets/images/HangmanFull.png")), findsOneWidget);
  });
}