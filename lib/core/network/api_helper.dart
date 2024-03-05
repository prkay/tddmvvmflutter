import 'dart:convert';

class ApiHelper {
  static String toJson(dynamic object) {
    return jsonEncode(object);
  }

  static dynamic fromJson(String jsonString) {
    return jsonDecode(jsonString);
  }
}
