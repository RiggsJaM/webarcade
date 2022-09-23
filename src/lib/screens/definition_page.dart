import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:retro_arcade/models/definition_model.dart';
import 'package:retro_arcade/mw_key.dart';

import 'package:http/http.dart' as http;

/// The [fetchWelcome] function takes an http.Client [client] and
/// a String [myWord] as parameters. It is an asynchronous function,
/// meaning we have to wait for however long it takes for the server
/// to produce a [response].
/// TODO: Address the Data Structure issue. Decoding this bad boy is rough.
Future<Welcome> fetchWelcome(http.Client client, String myWord) async {
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

    // // Step 1, get a List<dynamic>
    // List<dynamic> responseBody = jsonDecode(response.body.toString());
    //
    //
    // debugPrint("Hello?"); // Still goes boom here.
    // // The following line of code produces the following runtime error:
    // // Expected Property Name or '}' in JSON at position 2
    //
    //
    //
    //
    // debugPrint('The runtime object type of the object we\'re trying to pass is: \n${definitionsList.runtimeType}\n');
    // debugPrint('About to print responseBody.toString() contents\n\n');
    // debugPrint('${definitionsList}');
    //
    //
    // //
    // //List<dynamic> metaList
    //
    // Map<String,dynamic> parsed = jsonDecode(responseBody.toString()).cast<Map<String, dynamic>>();
    //
    //
    // debugPrint('It\'s contents are: \n${parsed}');
    // debugPrint("Servus!");
    //
    // var map = responseBody.first;
    // Record parsedList = Record.fromJson(map);
    //
    // debugPrint('The runtime object type of the object we\'re trying to pass is: \n${parsed.runtimeType}\n');
    //
    // //final retVal = parsed.map<Record>((json) => Record.fromJson(json)).toList();

    // We have a List<dynamic> that we want


    final welcomeList = welcomeFromJson(response.body);


    final firstDefMap = welcomeList.first;

    return firstDefMap;
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

  late Future<Welcome> futureWelcome;

  @override
  void initState() {
    super.initState();
    futureWelcome = fetchWelcome(http.Client(), "flutter"); // Added http.Client() for testing purposes
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
          child: FutureBuilder<Welcome>(
            future: futureWelcome,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.shortdef!.first.toString()); // Should give the first definition in the list
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
