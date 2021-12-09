import 'dart:convert';

import "package:http/http.dart" as http;

class PostData {
  static String baseUrl = "http://192.168.137.1:3367/api/";

  static simpanDataDB(Object obj) async {
    var url = baseUrl + "simpanDataBerkas";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri, body: obj);
    var data = json.decode(res.body);
    return data;
  }

  static Uri uri = Uri.parse("https://reqres.in/api/users?per_page=15");
}
