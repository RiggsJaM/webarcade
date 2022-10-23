// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';








import '../features/step/were_on_the_new_definition_page_page.dart';
import '../features/step/i_call_the_getdefinition_function_with.dart';
import '../features/step/i_get_a_valid200_response_from_the_server.dart';
import '../features/step/we_have_already_gotten_a_record.dart';
import '../features/step/i_call_the_parsejson_function_with.dart';
import '../features/step/i.dart';

void main() {
  group('''TestingApiCalls''', () {
    testWidgets('''Call the API, and get a 200 response from Server''', (tester) async {
      await wereOnTheNewDefinitionPagePage(tester);
      await iCallTheGetdefinitionFunctionWith(tester, "flutter");
      await iGetAValid200ResponseFromTheServer(tester);
    });
    testWidgets('''Parse already received response.''', (tester) async {
      await wereOnTheNewDefinitionPagePage(tester);
      await weHaveAlreadyGottenARecord(tester);
      await iCallTheParsejsonFunctionWith(tester, ""); // This test is broken, probably need to delete, and rework.
      await i(tester);
    });
  });
}
