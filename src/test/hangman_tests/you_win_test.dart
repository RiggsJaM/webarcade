import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman_debug.dart';

void main() {
  testWidgets("You Win The Game", (WidgetTester tester) async {
    await tester.pumpWidget(new HangmanDebug());

    await tester.tap(find.text('T'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('E'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('S'));
    await tester.pumpAndSettle();

    expect(find.text("You Win", skipOffstage: false), findsOneWidget);
  });
}