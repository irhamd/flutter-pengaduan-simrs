// ignore_for_file: unused_element

import 'dart:convert';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import "package:http/http.dart" as http;

// String baseUrl = "http://192.168.122.180:3367/api/";
// String baseUrlRoute = "http://192.168.220.180:3367";

// String baseUrlRoute = "http://10.10.102.3:3367";

// String baseUrlRoute = "http://192.168.220.180:3367";
String baseUrlRoute = "http://192.168.132.180:3367";
// String baseUrlRoute = "http://172.16.0.77:3367";
String baseUrl = "$baseUrlRoute/api/";

// final baseUrl = "http://10.10.102.3:3367/api/";

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

  static getData(String route) async {
    //   Uri uri = Uri.parse(baseUrl + route);
    //   var result = await http.get(uri, headers: _headers);
    //   return json.decode(result.body);
    // }

    Uri uri = Uri.parse(baseUrl + route);
    var result = await http.get(uri, headers: _headers);
    Map hasil = json.decode(result.body);
    // print(hasil);
    return hasil;
  }

  static Future<List<dynamic>> getFuture(String route) async {
    Uri uri = Uri.parse(baseUrl + route);
    print(baseUrl + route);
    print(Var_tokenx);
    var result = await http.get(uri, headers: _headers);
    return json.decode(result.body);
  }

  static Future<bool> SaveImageToApi(Map<String, String> body,
      String filepath_sebelum, filepath_setelah, contex) async {
    String route = baseUrl + 'pengaduan-simpanFollowUpPengaduan';
    // print(route);
    // print(body);
    // print(filepath_sebelum);
    // print(filepath_setelah);

    Map<String, String> headers123 = {
      'Content-Type': 'multipart/form-data',
    };

    var request = http.MultipartRequest('POST', Uri.parse(route))
      ..fields.addAll(body)
      ..headers.addAll(_headers)
      ..files.add(
          await http.MultipartFile.fromPath('image_sebelum', filepath_sebelum))
      ..files.add(
          await http.MultipartFile.fromPath('image_setelah', filepath_setelah));
    await request.send().then((result) async {
      http.Response.fromStream(result).then((response) {
        EasyLoading.dismiss();
        Map map = jsonDecode(response.body);

        if (map['sts'] == 1) {
          EasyLoading.showSuccess("Suksess .!");
          Navigator.pop(contex);
        }
        // ShowMessage("Suksess", context);
        else {
          EasyLoading.showError('Gagal simpan data .!');
        }
      });
    }).catchError((err) {
      print('error : ' + err.toString());
    }).whenComplete(() {});

    // print(response.stream.bytesToString());
    // if (response.statusCode == 200) {
    //   print("berhasill");
    //   return true;
    // } else {
    //   print("gagal");
    //   return false;
    // }
  }
}
