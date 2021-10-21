import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model.dart';

class API_Manager {
  Future<Api> getAxo() async {
    var client = http.Client();
    var apiModel = null;
    var url = Uri.parse("https://axoltlapi.herokuapp.com/");

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        apiModel = Api.fromJson(jsonMap);
      }
    } on Exception {
      return apiModel;
    }
    return apiModel;
  }
}
