import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:retro_arcade/models/word.dart';
import 'package:retro_arcade/mw_key.dart';

import 'package:http/http.dart' as http;


Future<Word> fetchWord(http.Client client, String myWord) async {
  final String url = 'https://dictionaryapi.com/api/v3/references/collegiate/json/${myWord}?key=${mw_apiKey}';
  final response = await client.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var objectFromJson = jsonDecode(response.body);
    // objectFromJson is a LIST! We want to map it properly.
    // The list is of each definition. Inside each definition are the fields we want.
    // The debugPrint should help visualize this.
    List<dynamic> list = jsonDecode(response.body);
    for (int i=0; i < list.length; i++)
      {
        debugPrint('${list[i]}\n');
      }
    // Goes boom here... fromJson expects Map, but objectFromJson is a List...
    var wordFromJson = Word.fromJson(objectFromJson);

    debugPrint('The runtime object type of the object we\'re trying to pass is: \n${wordFromJson.runtimeType}\n');

    return Word.fromJson(json.decode(response.body));
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

  late Future<Word> futureWord;

  @override
  void initState() {
    super.initState();
    futureWord = fetchWord(http.Client(), "flutter"); // Added http.Client() for testing purposes
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
          child: FutureBuilder<Word>(
            future: futureWord,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.definitions.first.toString()); // Should give the first definition in the list
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
