class MetaMap {
  // This is where the meta Map will live.
  late final String id;

  MetaMap({required this.id});

  //It contains one key value pair that we want. id: string.

// We want this one to be Map<String,String> because we only want the ID!
  factory MetaMap.fromJson(Map<String, String> json) {
    return MetaMap(
        id: json['id'].toString(),
    );
  }
}