import 'dart:convert';


import 'package:http/http.dart' as http;

import 'package:retro_arcade/models/definition_model.dart';

class MerriamWebsterApi {
  static const _API_KEY = '32937a90-4ee0-447f-a32f-086748f57c69';


  /// The [getDefinitionRecord] function takes two parameters as input,
  /// an http.Client() client (from the package:http/http.dart as http;)
  /// and a String myWord, which corresponds with the word to be searched.
  /// The return type is a Future<http.Response>.
  Future<http.Response> getDefinitionRecord(http.Client client,
      String myWord) async {
    final String url = 'https://dictionaryapi.com/api/v3/references/collegiate/json/${myWord}?key=${_API_KEY}';


    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load definition');
    }

  } // fcn end


  // The JSON Parse doesn't have to be Future! Because our string should be
  //  freshly generated!



  List<Record> parseJsonResponse(String jsonResponse) {

    // Here is where we do the same parsing as before,
    //  but it doesn't have to be asynchronous!


    final parsed = recordFromJson(jsonResponse); // Produces a List of records

    return parsed;
  }


} // class end