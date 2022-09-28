
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

  late TextEditingController _wordController;


  String _currentJsonResponse = "";
  String _currentWord = "";
  String _currentWordShortdef = "";
  bool _apiCall = false;

  // member functions

  /// The private _callDictionaryApi function takes a String [myWord] as
  /// parameter input, and then calls the [merriam_webster_api] API functions,
  /// and updates the
  void _callDictionaryApi(String myWord) {
    var api = MerriamWebsterApi(); // so far so good

    // Here is where we actually make our req
    api.getDefinitionRecord(http.Client(), myWord).then((httpResponse) {
          _currentWord = myWord;
          _currentJsonResponse = httpResponse.body; // Works up to here
          var tempList = [];
          tempList = api.parseJsonResponse(_currentJsonResponse);
          // Dies here...
          setState(() {
            // Disable Progress bar
            _apiCall = false;
            _currentJsonResponse = httpResponse.body; // This is a JSON String
            _currentWordShortdef = tempList!.first!.shortdef!.toString();
            _wordController.text = myWord;

            debugPrint('Currently inside the _callDictionaryApi function.');
            debugPrint('');
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
      this._wordController.text = '';
      this._currentWord = '';
      this._currentWordShortdef = '';
      this._currentJsonResponse = '';
    });
  }


  // Init State function


  @override
  void initState() {
    super.initState();

    // Forgetting to initalize here will make go bam bam


    this._wordController = TextEditingController();
  }


  @override
  void dispose() {
    _wordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
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
                    border: InputBorder.none,
                    hintText: 'Search the Merriam-Webster\'s Dictionary: '
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
                      _callDictionaryApi(_wordController.text); // possibly breaking (inside) here?
                      debugPrint(
                          'Fetch Button Pressed... The current JSON Response is: \n${_currentJsonResponse}');

                      showDialog(
                        context: context,
                        builder: (context) {
                          // Update the definition
                          //_updateApiRecord(_wordController.text);
                          debugPrint('About to return the AlertDialog, the _currentWord is: ${_currentWord}');
                          return AlertDialog(
                            content: (
                                Text('${_currentWord}\n\n${_currentWordShortdef}')

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


  /// The [_getProperWidget] function returns a Widget, depending on
  /// whether or not the asynchronous item being requested loads
  /// accordingly. If nothing is yet received, show the
  /// CircularProgressInidicator Widget, and if it receives the
  /// response, it prints first definition. TODO: add a column, and add more texts
  Widget _getProperWidget() {
    if (_apiCall) {
      return CircularProgressIndicator();
    } else {
      debugPrint('The current JSON Response is: \n${_currentJsonResponse}');
      return Text(
        '${_currentWordShortdef}',
        style: Theme
            .of(context)
            .textTheme
            .displayMedium,
      );
    }
  }
}