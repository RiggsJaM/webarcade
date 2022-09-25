import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/main.dart';
import 'package:retro_arcade/screens/tests_page.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(GherkinTestsPage(title: "Test if the app is running!"));
}
