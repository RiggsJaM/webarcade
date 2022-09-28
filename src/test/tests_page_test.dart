// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_see_text.dart';
import './step/i_tap_icon.dart';
import './step/i_dont_see_text.dart';

void main() {
  group('''TestsPage''', () {
    testWidgets('''Initial counter value is 0''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, '0');
    });
    testWidgets('''Plus button increases the counter value''', (tester) async {
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.add);
    });
    testWidgets('''The text is BDD rules when the counter value is 3''', (tester) async {
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.add);
      await iTapIcon(tester, Icons.add);
      await iTapIcon(tester, Icons.add);
      await iDontSeeText(tester, '3');
      await iSeeText(tester, 'BDD Rules!');
      await iTapIcon(tester, Icons.add);
      await iSeeText(tester, '4');
    });
  });
}
