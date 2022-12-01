import 'dart:convert';

import 'package:flutter/cupertino.dart';

/// The [recordFromJson] function takes a JSON string as parameter input, and
/// returns a List of Records representing the list of records from the JSON.
List<Record>  recordFromJson(String  str) => List<Record>.from(jsonDecode(str).map((x) => Record.fromJson(x)));

/// The [recordToJson] function takes a List of Records [data], and returns
/// a String which represents the JSON conversion of a list of records
String  recordToJson(List<Record>  data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// The [Record] class is a complex data structure which represents each
/// individual definition, within the Merriam-Websters Collegiate Dictionary.
class Record {
  Record({
    required this.meta,
    required this.hom,
    required this.hwi,
    required this.fl,
    required this.ins,
    required this.def,
    required this.uros,
    required this.et,
    required this.date,
    required this.shortdef,
  });

  Meta? meta;
  int? hom;
  Hwi? hwi;
  String? fl;
  List<In >? ins;
  List<Def >? def;
  List<Uro >? uros;
  List<List<String > >? et;
  String? date;
  List<String >? shortdef;

  /// The [Record.fromJson] function takes a Map<String,dynamic> which represents
  /// the [json], and it returns a factory of Records.
  factory Record.fromJson(Map<String , dynamic>  json) => Record(
    meta: Meta.fromJson(json["meta"]),
    hom: json["hom"] == null ? null : json["hom"],
    hwi: Hwi.fromJson(json["hwi"]),
    fl: json["fl"],
    ins: json["ins"] == null ? null : List<In >.from(json["ins"].map((x) => In.fromJson(x))),
    def: List<Def >.from(json["def"].map((x) => Def.fromJson(x))),
    uros: json["uros"] == null ? null : List<Uro >.from(json["uros"].map((x) => Uro.fromJson(x))),
    et: json["et"] == null ? null : List<List<String > >.from(json["et"].map((x) => List<String >.from(x.map((x) => x)))),
    date: json["date"],
    shortdef: List<String >.from(json["shortdef"].map((x) => x)),
  );

  /// The [toJson] function is a member function of the Record class, and returns
  /// a Map<String, dynamic> representing the JSON form of the Record.
  Map<String , dynamic>  toJson() => {
    "meta": meta!.toJson(),
    "hom": hom == null ? null : hom,
    "hwi": hwi!.toJson(),
    "fl": fl,
    "ins": ins == null ? null : List<dynamic>.from(ins!.map((x) => x.toJson())),
    "def": List<dynamic>.from(def!.map((x) => x.toJson())),
    "uros": uros == null ? null : List<dynamic>.from(uros!.map((x) => x.toJson())),
    "et": et == null ? null : List<dynamic>.from(et!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "date": date,
    "shortdef": List<dynamic>.from(shortdef!.map((x) => x)),
  };
}

/// The [Def] class represents the internal definition class, which is an
/// member attribute of the Record class.
class Def {
  /// The [Def] constructor sets vd and sseq, internal members of the Def class.
  Def({
    this.vd,
    this.sseq,
  });

  String? vd;
  List<List<List<dynamic> > >? sseq;

  /// The [fromJson] function takes a Map<String,dynamic> [json], which  then
  /// returns a factory of Definitions.
  factory Def.fromJson(Map<String , dynamic>  json) => Def(
    vd: json["vd"] == null ? null : json["vd"],
    sseq: List<List<List<dynamic> > >.from(json["sseq"].map((x) => List<List<dynamic> >.from(x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
  );

  /// The [toJson] function is a member function of the Def class, and returns
  /// a Map<String, dynamic> representing the JSON form of the Record.
  Map<String , dynamic>  toJson() => {
    "vd": vd == null ? null : vd,
    "sseq": List<dynamic>.from(sseq!.map((x) => List<dynamic>.from(x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
  };

  /// The [makeString] function takes the current word contained by the Record,
  /// and returns its String representation.
  String makeString()
  {

    //String response = sseq!.first!.first!.elementAt(1)!.elementAt(1)!.elementAt(0)!.elementAt(1)!.toString();
    debugPrint("In makeString function: Printing... \n\n");
    var temp = sseq!.first!.first; debugPrint("${temp}, \n");
    var temp2 = temp[1]; debugPrint("${temp2}, \n");
    var temp3 = temp2; debugPrint("${temp3}, \n"); // Produces null...
    var temp4 = temp3[0]; debugPrint("${temp4}, \n");
    var temp5 = temp4[1]; debugPrint("${temp5}, \n");
    String tempS = temp5.toString(); debugPrint("${tempS}, \n");

    debugPrint("\n\n");
    return tempS;
  }

}

/// The [SseqClass] represents the internal Sseq of the Record, which is the
/// sense sequence, or the part of speech.
class SseqClass {
  SseqClass({
    this.sn,
    this.dt,
    this.sls,
  });

  String? sn;
  List<List<dynamic> >? dt;
  List<String >? sls;

  /// The [fromJson] function takes a Map<String,dynamic> [json], which  then
  /// returns a factory of Sseq.
  factory SseqClass.fromJson(Map<String , dynamic>  json) => SseqClass(
    sn: json["sn"] == null ? null : json["sn"],
    dt: List<List<dynamic> >.from(json["dt"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    sls: json["sls"] == null ? null : List<String >.from(json["sls"].map((x) => x)),
  );

  /// The [toJson] function is a member function of the Def class, and returns
  /// a Map<String, dynamic> representing the JSON form of the Sseq.
  Map<String , dynamic>  toJson() => {
    "sn": sn == null ? null : sn,
    "dt": List<dynamic>.from(dt!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "sls": sls == null ? null : List<dynamic>.from(sls!.map((x) => x)),
  };
}

/// The [DtClass] class represents the internal Dt class, which is an
/// member attribute of the Record class, and contains information about
/// the defining text.
class DtClass {
  DtClass({
    this.t,
  });

  String? t;

  /// The [fromJson] function takes a Map<String,dynamic> [json], which  then
  /// returns a factory of Dt.
  factory DtClass.fromJson(Map<String , dynamic>  json) => DtClass(
    t: json["t"],
  );

  /// The [toJson] function is a member function of the Dt class, and returns
  /// a Map<String, dynamic> representing the JSON form of the defining text.
  Map<String , dynamic>  toJson() => {
    "t": t,
  };

  /// The [makeString] function takes the current defining text contained by the Record,
  /// and returns its String representation.
  String makeString()
  {


    return t.toString();
  }
}

enum SseqEnum { SENSE }

final sseqEnumValues = EnumValues({
  "sense": SseqEnum.SENSE
});

/// The [Hwi] class represents the internal Hwi class, which is an
/// member attribute of the Record class, and contains information about
/// the Headword.
class Hwi {
  Hwi({
    this.hw,
    this.prs,
  });

  String? hw;
  List<Pr >? prs;

  /// The [fromJson] function takes a Map<String,dynamic> [json], which  then
  /// returns a factory of [Hwi].
  factory Hwi.fromJson(Map<String , dynamic>  json) => Hwi(
    hw: json["hw"],
    prs: json["prs"] == null ? null : List<Pr >.from(json["prs"].map((x) => Pr.fromJson(x))),
  );

  /// The [toJson] function is a member function of the [Hwi] class, and returns
  /// a Map<String, dynamic> representing the JSON form of the Headword.
  Map<String , dynamic>  toJson() => {
    "hw": hw,
    "prs": prs == null ? null : List<dynamic>.from(prs!.map((x) => x.toJson())),
  };
}

/// The [Pr] class represents the internal [Pr] class, which is an
/// member attribute of the Record class, and contains information about
/// the Pronunciation.
class Pr {
  Pr({
    this.mw,
    this.sound,
  });

  String? mw;
  Sound? sound;

  /// The [fromJson] function takes a Map<String,dynamic> [json], which  then
  /// returns a factory of [Pr].
  factory Pr.fromJson(Map<String , dynamic>  json) => Pr(
    mw: json["mw"],
    sound: Sound.fromJson(json["sound"]),
  );

  /// The [toJson] function is a member function of the [Pr] class, and returns
  /// a Map<String, dynamic> representing the JSON form of the Headword.
  Map<String , dynamic>  toJson() => {
    "mw": mw,
    "sound": sound!.toJson(),
  };
}

/// The [Sound] class represents the internal [Sound] class, which is an
/// member attribute of the Record class, and contains information about
/// the Pronunciation.
class Sound {
  Sound({
    this.audio,
    this.ref,
    this.stat,
  });

  String? audio;
  String? ref;
  String? stat;

  factory Sound.fromJson(Map<String , dynamic>  json) => Sound(
    audio: json["audio"],
    ref: json["ref"],
    stat: json["stat"],
  );

  Map<String , dynamic>  toJson() => {
    "audio": audio,
    "ref": ref,
    "stat": stat,
  };
}

class In {
  In({
    this.inIf,
  });

  String? inIf;

  factory In.fromJson(Map<String , dynamic>  json) => In(
    inIf: json["if"],
  );

  Map<String , dynamic>  toJson() => {
    "if": inIf,
  };
}

class Meta {
  Meta({
    this.id,
    this.uuid,
    this.sort,
    this.src,
    this.section,
    this.stems,
    this.offensive,
  });

  String? id;
  String? uuid;
  String? sort;
  String? src;
  String? section;
  List<String >? stems;
  bool? offensive;

  factory Meta.fromJson(Map<String , dynamic>  json) => Meta(
    id: json["id"],
    uuid: json["uuid"],
    sort: json["sort"],
    src: json["src"],
    section: json["section"],
    stems: List<String >.from(json["stems"].map((x) => x)),
    offensive: json["offensive"],
  );

  Map<String , dynamic>  toJson() => {
    "id": id,
    "uuid": uuid,
    "sort": sort,
    "src": src,
    "section": section,
    "stems": List<dynamic>.from(stems!.map((x) => x)),
    "offensive": offensive,
  };
}

class Uro {
  Uro({
    this.ure,
    this.prs,
    this.fl,
  });

  String? ure;
  List<Pr >? prs;
  String? fl;

  factory Uro.fromJson(Map<String , dynamic>  json) => Uro(
    ure: json["ure"],
    prs: List<Pr >.from(json["prs"].map((x) => Pr.fromJson(x))),
    fl: json["fl"],
  );

  Map<String , dynamic>  toJson() => {
    "ure": ure,
    "prs": List<dynamic>.from(prs!.map((x) => x.toJson())),
    "fl": fl,
  };
}

class EnumValues<T> {
  Map<String , T >  map;
  Map<T , String >? reverseMap;

  EnumValues(this.map);

  Map<T , String >? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}