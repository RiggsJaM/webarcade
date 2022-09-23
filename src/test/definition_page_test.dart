import 'package:retro_arcade/models/definition_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:retro_arcade/main.dart';
import 'package:mockito/annotations.dart';
import 'package:retro_arcade/screens/definition_page.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {

  group('fetchDefinition', () {
    test('returns a Definition if the http call completes successfully', () async {
      final client = MockClient((_) async =>
        http.Response(response, 200));
      expect(await fetchWelcome(client, "flutter"), isA<Welcome>());

    });
  });


}

//String response = '{"word": "flutter", "ref": "c", "shortdef": "an alternating whipping motion of the legs used in various swimming styles (such as the crawl)", "fl": "noun"}';

String response = '{"meta":{"id":"flutter:1","uuid":"85f8eccb-8bda-4a0f-8128-dbcb8898344e","sort":"062168000","src":"collegiate","section":"alpha","stems":["flutter","fluttered","flutterer","flutterers","fluttering","flutters","fluttery"],"offensive":false},"hom":1,"hwi":{"hw":"flut*ter","prs":[{"mw":"\u02c8fl\u0259-t\u0259r","sound":{"audio":"flutte01","ref":"c","stat":"1"}}]},"fl":"verb","ins":[{"if":"flut*tered"},{"if":"flut*ter*ing"},{"if":"flut*ters"}],"def":[{"vd":"intransitive verb","sseq":[[["sense",{"sn":"1","dt":[["text","{bc}to flap the wings rapidly "],["vis",[{"t":"butterflies {wi}fluttering{\/wi} among the flowers"}]]]}]],[["sense",{"sn":"2 a","dt":[["text","{bc}to move with quick wavering or flapping motions "],["vis",[{"t":"a sail {wi}fluttering{\/wi} in the wind"}]]]}],["sense",{"sn":"b","dt":[["text","{bc}to vibrate in irregular spasms "],["vis",[{"t":"his heart {wi}fluttered{\/wi}"}]]]}]],[["sense",{"sn":"3","dt":[["text","{bc}to move about or behave in an agitated aimless manner "],["vis",[{"t":"She nervously {wi}fluttered{\/wi} around the office."}]]]}]]]},{"vd":"transitive verb","sseq":[[["sense",{"dt":[["text","{bc}to cause to flutter "],["vis",[{"t":"The bird was {wi}fluttering{\/wi} its wings."}]]]}]]]}],"uros":[{"ure":"flut*ter*er","prs":[{"mw":"\u02c8fl\u0259-t\u0259r-\u0259r","sound":{"audio":"flutte02","ref":"c","stat":"1"}}],"fl":"noun"},{"ure":"flut*tery","prs":[{"mw":"\u02c8fl\u0259-t\u0259r-\u0113","sound":{"audio":"flutte03","ref":"c","stat":"1"}}],"fl":"adjective"}],"et":[["text","Middle English {it}floteren{\/it} to float, flutter, from Old English {it}floterian{\/it}, frequentative of {it}flotian{\/it} to float; akin to Old English {it}fl\u0113otan{\/it} to float {ma}{mat|fleet|}{\/ma}"]],"date":"before 12th century{ds|i|1||}","shortdef":["to flap the wings rapidly","to move with quick wavering or flapping motions","to vibrate in irregular spasms"]}';






