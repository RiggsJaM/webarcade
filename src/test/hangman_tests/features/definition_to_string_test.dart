// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'step/the_api_request_was_successful.dart';
import 'step/i_call_definitions_to_string_method.dart';
import 'step/i_get_a_valid_string.dart';

void main() {
  group('''DefinitionToString''', () {
    testWidgets('''Create a To String function for the long definition''', (tester) async {
      await theApiRequestWasSuccessful(tester);
      await iCallDefinitionsToStringMethod(tester);
      await iGetAValidString(tester);
    });
  });
}
