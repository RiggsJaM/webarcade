import 'package:flutter_test/flutter_test.dart';
import 'package:retro_arcade/models/definition_model.dart';
import 'package:retro_arcade/models/merriam_webster_api.dart';

Future<void> iGetAValidString(WidgetTester tester) async {

  String responseList = '[{"meta":{"id":"flutter:1","uuid":"85f8eccb-8bda-4a0f-8128-dbcb8898344e","sort":"062168000","src":"collegiate","section":"alpha","stems":["flutter","fluttered","flutterer","flutterers","fluttering","flutters","fluttery"],"offensive":false},"hom":1,"hwi":{"hw":"flut*ter","prs":[{"mw":"\u02c8fl\u0259-t\u0259r","sound":{"audio":"flutte01","ref":"c","stat":"1"}}]},"fl":"verb","ins":[{"if":"flut*tered"},{"if":"flut*ter*ing"},{"if":"flut*ters"}],"def":[{"vd":"intransitive verb","sseq":[[["sense",{"sn":"1","dt":[["text","{bc}to flap the wings rapidly "],["vis",[{"t":"butterflies {wi}fluttering{\/wi} among the flowers"}]]]}]],[["sense",{"sn":"2 a","dt":[["text","{bc}to move with quick wavering or flapping motions "],["vis",[{"t":"a sail {wi}fluttering{\/wi} in the wind"}]]]}],["sense",{"sn":"b","dt":[["text","{bc}to vibrate in irregular spasms "],["vis",[{"t":"his heart {wi}fluttered{\/wi}"}]]]}]],[["sense",{"sn":"3","dt":[["text","{bc}to move about or behave in an agitated aimless manner "],["vis",[{"t":"She nervously {wi}fluttered{\/wi} around the office."}]]]}]]]},{"vd":"transitive verb","sseq":[[["sense",{"dt":[["text","{bc}to cause to flutter "],["vis",[{"t":"The bird was {wi}fluttering{\/wi} its wings."}]]]}]]]}],"uros":[{"ure":"flut*ter*er","prs":[{"mw":"\u02c8fl\u0259-t\u0259r-\u0259r","sound":{"audio":"flutte02","ref":"c","stat":"1"}}],"fl":"noun"},{"ure":"flut*tery","prs":[{"mw":"\u02c8fl\u0259-t\u0259r-\u0113","sound":{"audio":"flutte03","ref":"c","stat":"1"}}],"fl":"adjective"}],"et":[["text","Middle English {it}floteren{\/it} to float, flutter, from Old English {it}floterian{\/it}, frequentative of {it}flotian{\/it} to float; akin to Old English {it}fl\u0113otan{\/it} to float {ma}{mat|fleet|}{\/ma}"]],"date":"before 12th century{ds|i|1||}","shortdef":["to flap the wings rapidly","to move with quick wavering or flapping motions","to vibrate in irregular spasms"]},{"meta":{"id":"flutter:2","uuid":"1221b541-1163-46b9-92ea-ecef03ac33be","sort":"062169000","src":"collegiate","section":"alpha","stems":["flutter","flutters"],"offensive":false},"hom":2,"hwi":{"hw":"flutter"},"fl":"noun","def":[{"sseq":[[["sense",{"sn":"1","dt":[["text","{bc}an act of {a_link|fluttering}"]]}]],[["sense",{"sn":"2 a","dt":[["text","{bc}a state of nervous confusion or excitement"]]}],["sense",{"sn":"b","dt":[["text","{bc}{sx|flurry||}, {sx|commotion||}"]]}],["sense",{"sn":"c","dt":[["text","{bc}abnormal spasmodic fluttering of a body part "],["vis",[{"t":"treatment of atrial {wi}flutter{\/wi}"}]]]}]],[["sense",{"sn":"3 a","dt":[["text","{bc}a distortion in reproduced sound similar to but of a higher pitch than wow"]]}],["sense",{"sn":"b","dt":[["text","{bc}fluctuation in the brightness of a television image"]]}]],[["sense",{"sn":"4","dt":[["text","{bc}an unwanted oscillation (as of an aileron or a bridge) set up by natural forces"]]}]],[["sense",{"sn":"5","sls":["chiefly British"],"dt":[["text","{bc}a small speculative venture or gamble"]]}]]]}],"et":[["text","{dx_ety}see {dxt|flutter:1||}{\/dx_ety}"]],"date":"1641{ds||1||}","shortdef":["an act of fluttering","a state of nervous confusion or excitement","flurry, commotion"]},{"meta":{"id":"flutter kick","uuid":"538020df-88c0-4170-a880-6b602755934f","sort":"062170000","src":"collegiate","section":"alpha","stems":["flutter","flutter kick","flutter kicks"],"offensive":false},"hwi":{"hw":"flutter kick"},"fl":"noun","def":[{"sseq":[[["sense",{"dt":[["text","{bc}an alternating whipping motion of the legs used in various swimming styles (such as the crawl)"]]}]]]}],"date":"circa 1934","shortdef":["an alternating whipping motion of the legs used in various swimming styles (such as the crawl)"]},{"meta":{"id":"flutter sleeve","uuid":"997b4d6a-ebec-401e-91e4-3988b3bea27f","sort":"062171000","src":"collegiate","section":"alpha","stems":["flutter sleeve","flutter sleeves"],"offensive":false},"hwi":{"hw":"flutter sleeve"},"fl":"noun","def":[{"sseq":[[["sense",{"dt":[["text","{bc}a loose-fitting tapered sleeve falling in folds over the upper arm"]]}]]]}],"date":"1973","shortdef":["a loose-fitting tapered sleeve falling in folds over the upper arm"]}]';

  var api =  MerriamWebsterApi();

  var tempList = [];
  tempList = api.parseJsonResponse(responseList);

  late Record myRec = tempList.first;



  Def myDef = myRec!.def!.first;
  var mysSeq = myDef.sseq;
  var myDefin = mysSeq!.first;

  late String response = myDefin.toString();

  expect(response, isNotNull);
  expect(response != "-1", true);


  // After considerable testing and so forth, it has become clear that the
  //  use of shortdef is just gonna have to suffice. It doesn't afford
  //  anything right now to use dt, from deep within the def class.


}