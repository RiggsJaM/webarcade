import 'package:prototype/models/definition.dart';

class Word {
  final String word;
  final List<Definition> definitions;

  Word({required this.word, required this.definitions});

  factory Word.fromJson(Map<String, dynamic> json) {
    var list = json['def'] as List; // TODO: test this!!!
    List<Definition> definitionsList =
    list.map((i) => Definition.fromJson(i)).toList();

    return Word(
      word: json['word'], //TODO: Test This!!!
      definitions: definitionsList,
    );
  }
}