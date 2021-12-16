import 'dart:async';
import 'dart:convert';

import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/api/_api.dart';
import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:applikasi_pelaporan_simrs/service/forms/_Button.dart';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:custom_switch/custom_switch.dart';

class TestCamera extends StatefulWidget {
  const TestCamera({key}) : super(key: key);

  @override
  TestCameraState createState() => TestCameraState();
}

class TestCameraState extends State<TestCamera> {
  File _imagesebelum;
  File _imagesesudah;
  TextEditingController masalah = TextEditingController();
  TextEditingController penyabab = TextEditingController();
  TextEditingController solusi = TextEditingController();

  Map<String, dynamic> data = json.decode(Var_keluhan);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(Var_keluhan);

    // Object obj = jsonDecode(Var_keluhan);
  }

  final imagePicker = ImagePicker();

  Future getImageSebelum() async {
    final gambar = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      _imagesebelum = File(gambar.path);
    });
  }

  Future getImageSesudah() async {
    final gambar = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      _imagesesudah = File(gambar.path);
    });
  }

  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Input Visite")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: gradientColor(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(VarTitle),
                Inputan(
                  "Permasalahan",
                  TextEditingController()..text = data['isipengaduan'],
                ),
                Inputan(
                  "Nomor HP",
                  TextEditingController()..text = data['nohp'],
                ),
                Inputan(
                  "Ruangan",
                  TextEditingController()..text = data['unitkerja'],
                ),
                Inputan("Penyebab", penyabab),
                Inputan("Solusi", solusi),
                br(null),
                CustomSwitch(
                  activeColor: Colors.green,
                  value: status,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                ),
                br(null),
                Text("Foto sebelum "),
                br(null),
                _imagesebelum == null
                    ? Text("belum ada gambar sebelum")
                    : Image.file(_imagesebelum),
                br(null),
                ElevatedButton(
                    onPressed: () {
                      // _showMyDialog("dddd", context);
                      getImageSebelum();
                    },
                    child: Center(
                      child: Align(
                        alignment: Alignment
                            .center, // Align however you like (i.e .centerRight, centerLeft)
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt),
                            Text(" Foto sebelum"),
                          ],
                        ),
                      ),
                    )),
                br(null),
                _imagesesudah == null
                    ? Text("belum ada gambar setelah")
                    : Image.file(_imagesesudah),
                br(null),
                Text("Foto sesudah "),
                ElevatedButton(
                    onPressed: () {
                      // _showMyDialog("dddd", context);
                      getImageSesudah();
                    },
                    child: Center(
                      child: Align(
                        alignment: Alignment
                            .center, // Align however you like (i.e .centerRight, centerLeft)
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt),
                            Text(" Foto sesudah"),
                          ],
                        ),
                      ),
                    )),
                Button_(simpanFollowUp, " Simpan", Icons.ac_unit_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }

  simpanFollowUp1() {
    Api.post("pengaduan-simpanFollowUpPengaduan", {
      "id": data["id"].toString(),
      "penyebab": penyabab.text.toString(),
      "solusi": solusi.text.toString(),
      "close": status == true ? "0" : "1"
    }).then((res) {
      print(res);
      if (res["sts"] == 1) {
        ShowMessage("Berhasil ...", context);
      } else {
        ShowMessage("Gagal simpan data .!", context);
      }
    });
  }

  simpanFollowUp() {
    // EasyLoading.showProgress(0.3, status: 'downloading...');
    EasyLoading.show(status: 'loading...');
    Map<String, String> body = {
      "id": data["id"].toString(),
      "penyebab": penyabab.text.toString(),
      "solusi": solusi.text.toString(),
      "close": status == true ? "1" : "0"
    };
    Api_.SaveImageToApi(body, _imagesebelum.path, _imagesesudah.path, context);
  }

  getMasalah() {
    String ms = masalah.text.toString();
    setState(() {
      penyabab.text = ms.toString();
    });
  }
}
