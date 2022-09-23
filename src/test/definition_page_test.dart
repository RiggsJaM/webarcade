import 'package:retro_arcade/models/definition.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:retro_arcade/main.dart';
import 'package:mockito/annotations.dart';
import 'package:retro_arcade/models/record.dart';
import 'package:retro_arcade/screens/definition_page.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {

  group('fetchDefinition', () {
    test('returns a Definition if the http call completes successfully', () async {
      final client = MockClient((_) async =>
        http.Response(response, 200));
      expect(await fetchRecord(client, "flutter"), isA<Record>());

    });
  });


}

String response = '{"word": "flutter", "ref": "c", "shortdef": "an alternating whipping motion of the legs used in various swimming styles (such as the crawl)", "fl": "noun"}';