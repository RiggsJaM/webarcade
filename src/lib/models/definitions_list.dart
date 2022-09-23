import 'package:retro_arcade/models/record.dart';

class DefinitionsList {
  // Here is where the internal contents of
  //  each definition go.

  final List<Record> definitions;

  DefinitionsList({
    required this.definitions,
});


  // The fromJson function takes List<String> because we only want the shortdef/string
  factory DefinitionsList.fromJson(List<dynamic> parsedJson)
  {
    List<Record> definitions = <Record>[];

    // We never could use the Definition.fromJson method.
    // After we initialize our list, lets convert this bad boy to a Map!
    definitions = parsedJson.map((i)=>Record.fromJson(i)).toList();

    return DefinitionsList(
      definitions: definitions,
    );
  }

}