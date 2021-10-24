import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/character.dart';
import 'package:rick_and_morty_app/models/response.dart';

class ApiHelper {

  static Future<Response> getCharacters() async {
    var url = Uri.parse('https://rickandmortyapi.com/api/character');

    var response = await http.get(
      url,
      headers: {
        'content-Type': 'application/json',
        'accept': 'application/json'
      }
    );

    var body = response.body;

    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }

    List<Character> list = [];
    Map decodedJson = jsonDecode(body);
    var data = decodedJson["results"];

    if (decodedJson.length > 0) {
      for (var key in data) {
        if (key != "") {
          list.add(Character.fromJson(key));
        }
      }
    }

    return Response(isSuccess: true, result: list);
  }
}