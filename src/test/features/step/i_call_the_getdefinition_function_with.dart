import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:retro_arcade/models/definition_model.dart';
import 'package:retro_arcade/models/merriam_webster_api.dart';
import 'package:http/http.dart' as http;

import '../../merriam_webster_api_test.mocks.dart';

@GenerateMocks([http.Client])
Future<void> iCallTheGetdefinitionFunctionWith(WidgetTester tester, String myWord) async {


  // Call get definition, with myWord

  var api = MerriamWebsterApi();
  // Note, in tests, no http calls are actually allowed to pass through.
  // Api tests were already conducted before our transition to Ghurkin
  api.getDefinitionRecord(http.Client(), myWord).then((http.Response response) {
    expect(response.statusCode, 200);
  }) ; // Replace with Mockito client, once more research on HOW is done. ;)




}
