import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:retro_arcade/models/record.dart';
import 'package:retro_arcade/models/definitions_list.dart';
import 'package:retro_arcade/models/definition.dart';
import 'package:retro_arcade/mw_key.dart';

import 'package:http/http.dart' as http;


Future<Record> fetchRecord(http.Client client, String myWord) async {
  final String url = 'https://dictionaryapi.com/api/v3/references/collegiate/json/${myWord}?key=${mw_apiKey}';
  final response = await client.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    // var objectFromJson = jsonDecode(response.body);
    // // objectFromJson is a LIST! We want to map it properly.
    // // The list is of each definition. Inside each definition are the fields we want.
    // // The debugPrint should help visualize this.
    // List<dynamic> list = jsonDecode(response.body);
    // for (int i=0; i < list.length; i++)
    //   {
    //     debugPrint('${list[i]}\n');
    //   }
    // // Goes boom here... fromJson expects Map, but objectFromJson is a List...
    // var wordFromJson = Word.fromJson(objectFromJson);
    //
    // debugPrint('The runtime object type of the object we\'re trying to pass is: \n${wordFromJson.runtimeType}\n');
    //
    // return Word.fromJson(json.decode(response.body));

    // Step 1, get a List<dynamic>
    var responseBody = jsonDecode(response.body);



    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Record>((json) => Record.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load definition');
  }
}


class DefinitionPage extends StatefulWidget {
  DefinitionPage({super.key});


  @override
  State<DefinitionPage> createState() => _DefinitionPage();
}


class _DefinitionPage extends State<DefinitionPage> {

  late Future<Record> futureRecord;

  @override
  void initState() {
    super.initState();
    futureRecord = fetchRecord(http.Client(), "flutter"); // Added http.Client() for testing purposes
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Definition Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Definition Demo'),
        ),
        body: Center(
          child: FutureBuilder<Record>(
            future: futureRecord,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.shortDef.shortDef.toString()); // Should give the first definition in the list
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
