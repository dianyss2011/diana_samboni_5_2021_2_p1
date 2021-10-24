import 'package:rick_and_morty_app/models/character.dart';
import 'package:rick_and_morty_app/models/info.dart';

class Result {
  Info info = Info(count: 0, pages: 0, next: '', prev: null);
  List<Character> results = [];

  Result({required this.info,required this.results});

  Result.fromJson(Map<String, dynamic> json) {
    info = Info.fromJson(json['info']);
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(new Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['info'] = this.info.toJson();
    data['results'] = this.results.map((v) => v.toJson()).toList();
    return data;
  }
}