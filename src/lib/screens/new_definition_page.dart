
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:retro_arcade/models/definition_model.dart';
import 'package:retro_arcade/models/merriam_webster_api.dart';

class MyDefinitionPage extends StatefulWidget {
  MyDefinitionPage({super.key});

  @override
  State<MyDefinitionPage> createState() => _MyDefinitionPageState();

}



class _MyDefinitionPageState extends State<MyDefinitionPage> {

  // Declarations and Initializations

  late List<Record> _definitionsList;
  late TextEditingController _wordController;
  late Record _record;

  String _currentJsonResponse = "";
  bool _apiCall = false;

  // member functions

  void _callDictionaryApi(String myWord)
  {
    var api = MerriamWebsterApi();

    // Here is where we actually make our req
    api.getDefinitionRecord(http.Client(), myWord).then((response) {
      setState(() {
        // Disable Progress bar
        _apiCall = false;
        _currentJsonResponse = response.body; // This is a JSON String
        _definitionsList = api.parseJsonResponse(_currentJsonResponse);
      }); // Set state end
    }, onError: (error) {
      setState(() {
        _apiCall = false;
        _currentJsonResponse = error.toString();
      });
    });
  }

  void _reset({bool resetControllers = true}) {
    setState(() {
      this._definitionsList = [];
      this._wordController.text = '';
    });
  }


  // Init State function


  @override
  void initState() {
    super.initState();
    // Forgetting to initalize here will make go bam bam
    this._record = new Record(meta: null, hom: null, hwi: null, fl: '', ins: [], date: '', def: [], uros: [], et: [], shortdef: [], );
    this._definitionsList = <Record>[_record];
    this._wordController = TextEditingController();
  }


  @override
  void dispose()
  {
    _wordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary API Fetch Test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            textAlign: TextAlign.center,
            controller: this._wordController,
            decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Search the Merriam-Webster\'s Dictionary: '
            ),
          ),
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                //onPressed: _pending ? null : () => _recordFetch(http.Client(), _wordController!.text),
                onPressed: () {
                  setState(() {
                    _apiCall = true;
                  });
                  _callDictionaryApi(_wordController.text);


                  showDialog(
                    context: context,
                    builder: (context) {
                      // Update the definition
                      //_updateApiRecord(_wordController.text);
                      return AlertDialog(
                        content: (
                            Text('${_wordController
                                .text}\n\n${_definitionsList!.first!.shortdef!.first!.toString()}')

                        ),
                      );
                    },
                  ); //showDialog end
                },
                child: const Text('Fetch'),
              ),
              _getProperWidget(),
              ElevatedButton(
                onPressed: this._reset,
                child: const Text('Reset'),
              ),
            ],
          ),
        ]
      )
    );




  } // build fcn end

  Widget _getProperWidget() {
    if (_apiCall) {
      return CircularProgressIndicator();
    } else {
      return Text(
        '${_definitionsList!.first!.shortdef!.first!.toString()}',
        style: Theme.of(context).textTheme.displayMedium,
      );
    }
  }

}