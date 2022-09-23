import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
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

    final welcomeList = welcomeFromJson(response.body);
    final firstDefMap = welcomeList[0];
    final secondDefMap = welcomeList[1];

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
  // late TextEditingController _wordController;
  // late TextEditingController _definitionController;
  // late TextEditingController _urlController;

  String _responseBody = '<empty>';
  String _error = '<none>';
  bool _pending = false;

  @override
  void initState() {
    super.initState();
    futureWelcome = fetchWelcome(http.Client(), "flutter"); // Added http.Client() for testing purposes

    // this._definitionController = TextEditingController();
    // this._urlController = TextEditingController()
    //   ..text = 'https://dictionaryapi.com/api/v3/references/collegiate/json/';
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
            List<Widget> children;

            if (snapshot.hasData) {
              children = <Widget>[
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text("Flutter: \n"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(snapshot.data!.shortdef!.first.toString()),
                ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }

              // By default, show a loading spinner.
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                )
              );
            },
          ),
        ),
      ),
    );
  //   return ListView(
  //     padding: const EdgeInsets.all(16.0),
  //     children: <Widget>[
  //       TextField(
  //         controller: this._wordController,
  //         decoration: const InputDecoration(
  //           labelText: 'URL to GET',
  //           border: OutlineInputBorder(),
  //         ),
  //       ),
  //       const SizedBox(height: 4),
  //       TextField(
  //         controller: this._definitionController,
  //         decoration: const InputDecoration(
  //           labelText: 'Optional api token',
  //           border: OutlineInputBorder(),
  //         ),
  //       ),
  //       ButtonBar(
  //         children: <Widget>[
  //           ElevatedButton(
  //             onPressed: _pending
  //                 ? null
  //                 : () =>
  //                 _welcomeFetch(http.Client(), _wordController.text,
  //                     _definitionController.text),
  //             child: const Text('Get'),
  //           ),
  //           ElevatedButton(
  //             onPressed: this._reset,
  //             child: const Text('Reset'),
  //           ),
  //         ],
  //       ),
  //       Text('Response body=$_responseBody'),
  //       const Divider(),
  //       Text('Error=$_error'),
  //     ],
  //   );
  // }
  //
  //
  // void _reset({bool resetControllers = true}) {
  //   setState(() {
  //     if (resetControllers) {
  //       this._urlController.text =
  //       'https://dictionaryapi.com/api/v3/references/collegiate/json/';
  //     }
  //     this._responseBody = '<empty>';
  //     this._error = '<none>';
  //     this._pending = false;
  //   });
  // }
  //
  //
  // Future<Welcome> _welcomeFetch(http.Client client, String word,
  //     String text) async {
  //   _reset();
  //   setState(() => this._pending = true);
  //
  //   final String myUrl = '${_urlController.toString()}$word?key=${mw_apiKey}';
  //   final response = await client.get(Uri.parse(myUrl));
  //
  //
  //   if (response.statusCode == 200) {
  //     final welcomeList = welcomeFromJson(response.body);
  //     final firstDefMap = welcomeList[0];
  //
  //     return firstDefMap;
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load definition');
  //   }

    //   try {
    //
    //     // Usually we will add code to convert the response body into our data
    //     // class, e.g. using https://javiercbk.github.io/json_to_dart/.
    //     // **Tip**: use compute() function (from flutter/foundation.dart) to run
    //     // heavy json parsing work in a background isolate.
    //     final parsed = await compute(jsonDecode, response.body);
    //     debugPrint('parsed json object=$parsed');
    //     setState(() => this._responseBody = response.body);
    //   } catch (e) {
    //     setState(() => this._error = e.toString());
    //   }
    //   setState(() => this._pending = false);
    // }
  }
}
