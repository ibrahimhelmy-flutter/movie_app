import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/core/api_constants.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get(String path) async{
        final response = await _client.get(
        Uri.parse(
            "${ApiConstants.baseURl}$path?api_key=${ApiConstants.APIKEY}"),
        headers: {"Content-Type": "application/json"});
    var movies;
    if (response.statusCode == 200) { 
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
 