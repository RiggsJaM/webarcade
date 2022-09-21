import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prototype/main.dart';
import 'package:prototype/models/definition.dart';
import 'package:prototype/mw_key.dart';

import 'package:http/http.dart' as http;

String word = 'flutter';

final String url = 'https://dictionaryapi.com/api/v3/references/collegiate/json/' + word + "?key=" + mw_apiKey;




Future<Definition> fetchDefinition(http.Client client) async {
  final response = await client.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Definition.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load definition');
  }
}




class Definition_Page extends StatelessWidget {
  const Definition_Page ({super.key});

  @override
  State<StatefulWidget> createState() => DefinitionPage();

  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.deepOrange,
    );
  }
}

class DefinitionPage extends State<HomePage> {
  late Future<Definition> futureDefinition;

  @override
  void initState() {
    super.initState();
    futureDefinition = fetchDefinition(http.Client()); // Added http.Client() for testing purposes
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
          child: FutureBuilder<Definition>(
            future: futureDefinition,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.word);
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
