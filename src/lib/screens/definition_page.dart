import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retro_arcade/main.dart';
import 'package:retro_arcade/models/definition_model.dart';
import 'package:retro_arcade/mw_key.dart';

import 'package:http/http.dart' as http;

/// The [fetchRecord] function takes an http.Client [client] and
/// a String [myWord] as parameters. It is an asynchronous function,
/// meaning we have to wait for however long it takes for the server
/// to produce a [response].
/// TODO: Address the Data Structure issue. Decoding this bad boy is rough.
Future<List<Record>> fetchRecordList(http.Client client, String myWord) async {
  final String url = 'https://dictionaryapi.com/api/v3/references/collegiate/json/${myWord}?key=${mw_apiKey}';
  final response = await client.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON


    final recordList = recordFromJson(response.body);
    // final firstDefMap = recordList[0];
    // final secondDefMap = recordList[1];

    return recordList;
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

  String _urlPart = 'https://dictionaryapi.com/api/v3/references/collegiate/json/';

  late Future<List<Record>> _futureRecordList;
  late TextEditingController _wordController;

  String _responseBody = '<empty>';
  String _error = '<none>';
  bool _pending = false;
  late Record myRecord;


  @override
  void dispose() {
    _wordController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _futureRecordList = fetchRecordList(
        http.Client(), "flutter"); // Added http.Client() for testing purposes

    this._wordController = TextEditingController();
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
            title: const Text('Merriam-Webster\'s Collegiate Dictionary'),
          ),
          drawer: Drawer(
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      height: 50,
                      child: const DrawerHeader(
                        child: Text("Navigation"),
                      ),
                    ),
                    ListTile(
                      title: const Text("Home"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                      },
                    )
                  ]
              )
          ),
          body:
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: FutureBuilder<List<Record>>(
                    future: _futureRecordList,
                    builder: (context, snapshot) {
                      List<Widget> children;

                      if (snapshot.hasData) {
                        children = <Widget>[

                          // const Icon(
                          //   Icons.check_circle_outline,
                          //   color: Colors.green,
                          //   size: 60,
                          // ),

                          const Text(
                            'Enter a word to fetch from the Dictionary: ',
                            style: TextStyle(fontSize: 30),
                          ),

                          // Here is where the TextBox should go.

                          // TextField(
                          //   textAlign: TextAlign.center,
                          //   onChanged: (word) {
                          //     _saveWordFromUser(word);
                          //   },
                          //   controller: _wordController,
                          // ),

                          TextField(
                            textAlign: TextAlign.center,
                            controller: this._wordController,
                            decoration: const InputDecoration(
                              labelText: 'Search Merriam-Webster\'s Dictionary',
                              border: OutlineInputBorder(),
                            ),
                          ),

                          //
                          //
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 16),
                          //   child: Text(snapshot.data!.shortdef!.first.toString()),
                          // ),

                          ButtonBar(
                            children: <Widget>[
                              ElevatedButton(
                                //onPressed: _pending ? null : () => _recordFetch(http.Client(), _wordController!.text),
                                onPressed: () {
                                  _pending ? null : () =>
                                      _recordFetch(_wordController!.text);


                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      // Update the definition
                                      //_updateApiRecord(_wordController.text);
                                      return AlertDialog(
                                        content: (
                                            Text('${_wordController
                                                .text}\n\n${snapshot.data!
                                                .first!.shortdef!.toString()}')

                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text('Fetch'),
                              ),
                              ElevatedButton(
                                onPressed: this._reset,
                                child: const Text('Reset'),
                              ),
                            ],
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
              ]
          )
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
    //                 _recordFetch(http.Client(), _wordController.text,
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

    //
    //

  }

  void _reset({bool resetControllers = true}) {
    setState(() {
      this._wordController.text = '';
      this._responseBody = '<empty>';
      this._error = '<none>';
      this._pending = false;
    });
  }

  void _saveWordFromUser(String text) {
    _wordController.text = text;
  }

  void _doSomething() {
    print("Hallo Welt!");
  }

  void _updateApiResponse(String word) {
    _futureRecordList = fetchRecordList(http.Client(), word);
  }


  void _recordFetch(String myWord) async {
    _reset();
    setState(() => this._pending = true);
    setState(() => this._futureRecordList = fetchRecordList(http.Client(), myWord));
  }


  Future<void> _definitionFetch(http.Client client, String myWord) async {
    _reset();
    setState(() => this._pending = true);
    final String url = 'https://dictionaryapi.com/api/v3/references/collegiate/json/${myWord}?key=${mw_apiKey}';

    try {
      final http.Response response = await client.get(Uri.parse(url));
      // Usually we will add code to convert the response body into our data
      // class, e.g. using https://javiercbk.github.io/json_to_dart/.
      // **Tip**: use compute() function (from flutter/foundation.dart) to run
      // heavy json parsing work in a background isolate.
      final parsed = recordFromJson(response.body);
      print('parsed json object=$parsed');
      setState(() => this._responseBody = response.body);
    } catch (e) {
      setState(() => this._error = e.toString());
    }
    setState(() => this._pending = false);
  }
}
