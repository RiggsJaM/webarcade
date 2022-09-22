import 'package:RetroArcade/models/definition.dart';

class Word {
  final String id;
  final List<Definition> definitions;

  Word({required this.id, required this.definitions});

  factory Word.fromJson(Map<String, dynamic> json) {
    var list = json['shortdef'] as List; // TODO: test this!!!
    List<Definition> definitionsList =
    list.map((i) => Definition.fromJson(i)).toList();

    return Word(
      id: json['id'], //TODO: Test This!!!
      definitions: definitionsList,
    );
  }
}