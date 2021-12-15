// ignore_for_file: unused_element

import 'dart:convert';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import "package:http/http.dart" as http;

// String baseUrl = "http://192.168.137.1:3367/api/";
final baseUrl = "http://10.10.102.3:3367/api/";

var _headers = {
  // 'Authorization': "Bearer 234|nMVvKasZ3iOBgt4DclDtcfnIWyRB9JC6QNhXNw5X",
  'Authorization': "Bearer $Var_tokenx",
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

    Uri uri = Uri.parse(baseUrl + "pengaduan-getKeluhanPasien");
    var result = await http.get(uri, headers: _headers);
    return json.decode(result.body);
  }

  static Future<List<dynamic>> getFuture(String route) async {
    Uri uri = Uri.parse(baseUrl + route);
    print(baseUrl + route);
    print(Var_tokenx);
    var result = await http.get(uri, headers: _headers);
    return json.decode(result.body);
  }
}
