import 'package:retro_arcade/models/meta_map.dart';
import 'package:retro_arcade/models/shortdef.dart';

class Record {
  final MetaMap metaMap;
  final Map<String, String> functionLabel;
  final ShortDef shortDef;

  Record({
    required this.metaMap,
    required this.functionLabel,
    required this.shortDef});

  // Type should be same as whatever definitions_list gives
  factory Record.fromJson(Map<String, dynamic> json) {


    return Record(
      metaMap: json['meta'],
      functionLabel: json['fl'],
      shortDef: json['shortdef'],
    );
  }


}