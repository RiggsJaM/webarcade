class Definition {
  final String ref; // Which MW Api
  final String id;
  final String def;
  final String functionLabel;

  const Definition({
    required this.ref,
    required this.id,
    required this.def,
    required this.functionLabel});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      id: json['id'],
      ref: json['ref'],
      def: json['shortdef'], // Defining Text
      functionLabel: json['fl'],
    );
  }
}