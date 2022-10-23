import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/main.dart';

Future<void> theHangmanPageIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
}
