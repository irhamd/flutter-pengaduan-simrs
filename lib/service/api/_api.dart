// ignore_for_file: unused_element

import 'dart:convert';
import "package:http/http.dart" as http;

String baseUrl = "http://192.168.137.1:3367/api/";

var _headers = {
  'Authorization': "Bearer 234|nMVvKasZ3iOBgt4DclDtcfnIWyRB9JC6QNhXNw5X",
  "Accept": "application/json"
};

// ignore: camel_case_types
class Api_ {
  static post(String url, Object obj) async {
    Uri uri = Uri.parse(baseUrl + url);
    var res = await http.post(uri, body: obj, headers: _headers);
    var data = json.decode(res.body);
    return data;
  }

  static get(String route) async {
    //   Uri uri = Uri.parse(baseUrl + route);
    //   var result = await http.get(uri, headers: _headers);
    //   return json.decode(result.body);
    // }

    Uri uri =
        Uri.parse("http://192.168.137.1:3367/api/pengaduan-getKeluhanPasien");
    var result = await http.get(uri, headers: {
      'Authorization': "Bearer 234|nMVvKasZ3iOBgt4DclDtcfnIWyRB9JC6QNhXNw5X",
      "Accept": "application/json"
    });
    return json.decode(result.body);
  }

  static Future<List<dynamic>> getFuture(String route) async {
    // var result = await http.get(PostData.uri);
    // return json.decode(result.body)['data'];

    // return Api_.get("pengaduan-getKeluhanPasien");

    Uri uri = Uri.parse("http://192.168.137.1:3367/api/" + route);
    var result = await http.get(uri, headers: _headers);
    return json.decode(result.body);
  }
}