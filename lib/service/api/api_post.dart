// ignore_for_file: unused_element

import 'dart:convert';

import 'package:applikasi_pelaporan_simrs/service/api/_api.dart';
import "package:http/http.dart" as http;

// String baseUrl = "http://192.168.137.1:3367/api/";
// String baseUrl = "http://10.10.102.3:3367/api/";

class PostData {
  static simpanDataDB(Object obj) async {
    var url = baseUrl + "simpanDataBerkas";
    Uri uri = Uri.parse(url);
    var res = await http.post(uri, body: obj);
    var data = json.decode(res.body);
    return data;
  }

  // static Uri uri = Uri.parse("https://reqres.in/api/users?per_page=15");
}

var headers = {
  'Authorization': "Bearer 234|nMVvKasZ3iOBgt4DclDtcfnIWyRB9JC6QNhXNw5X",
  "Accept": "application/json"
};

class Api {
  static post(String url, Object obj) async {
    Uri uri = Uri.parse(baseUrl + url);
    var res = await http.post(uri, body: obj, headers: headers);
    var data = json.decode(res.body);
    return data;
  }

  static Uri uri = Uri.parse("https://reqres.in/api/users?per_page=15");
}
