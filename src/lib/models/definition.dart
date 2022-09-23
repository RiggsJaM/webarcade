import 'package:retro_arcade/models/record.dart';

class Definition {
  final String id;
  final List<Record> definitions;

  Definition({required this.id, required this.definitions});

  factory Definition.fromJson(Map<String, dynamic> json) {
    var list = json['shortdef'] as List; // TODO: test this!!!
    List<Record> definitionsList =
    list.map((i) => Record.fromJson(i)).toList();

    return Definition(
      id: json['id'], //TODO: Test This!!!
      definitions: definitionsList,
    );
  }
}