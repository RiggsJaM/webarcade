import 'package:retro_arcade/models/meta_map.dart';

/// The [Record] class has three attributes. The first is
/// a [metaMap]. It is a Map<String,String> which should
/// contain something like {['id']: "flutter"}. The next
/// is the [functionLabel]. It is a String, and corresponds
/// in the Merriam-Webster's Collegiate Dictionary with
/// the part of speech. Lastly is the [shortDef] attribute.
/// This is also a string, which corresponds with the
/// definition of a particular word.
class Record {
  final MetaMap metaMap;
  final String functionLabel;
  final String shortDef;

  Record({
    required this.metaMap,
    required this.functionLabel,
    required this.shortDef});

  // Type should be same as whatever definitions_list gives


  /// The [Record.fromJson] function takes a Map<String,dynamic>
  /// as input, and returns a record, mapping the values from
  /// the json file to our variables above.
  factory Record.fromJson(Map<String, dynamic> json) {


    return Record(
      metaMap: json['meta'],
      functionLabel: json['fl'].toString(),
      shortDef: json['shortdef'].toString(),
    );
  }


}