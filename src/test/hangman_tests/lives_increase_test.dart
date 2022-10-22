import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/screens/hangman.dart';

void main() {
  testWidgets("Wrong Guess Increases Lives", (WidgetTester tester) async {
    await tester.pumpWidget(new Hangman());
    await tester.ensureVisible(find.text('Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Z'));
    await tester.pumpAndSettle();

    expect(GamePageState.lives, 1);
    expect(find.text('Z'), findsOneWidget);
  });
}