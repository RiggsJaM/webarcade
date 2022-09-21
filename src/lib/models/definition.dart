class Definition {
  final String ref; // Which MW Api
  final String word;
  final String def;
  final String functionLabel;

  const Definition({
    required this.ref,
    required this.word,
    required this.def,
    required this.functionLabel});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      word: json['word'],
      ref: json['ref'],
      def: json['shortdef'], // Defining Text
      functionLabel: json['fl'],
    );
  }
}