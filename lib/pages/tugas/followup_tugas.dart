import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:notification/service/_input.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/forms/_Button.dart';
import 'package:notification/service/globalVar.dart';

class FollowUpTugas extends StatefulWidget {
  const FollowUpTugas({key}) : super(key: key);

  @override
  FollowUpTugasState createState() => FollowUpTugasState();
}

class FollowUpTugasState extends State<FollowUpTugas> {
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

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Input Tindakan")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: gradientColor(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                Button_(simpanFollowUp, " Simpan", Icons.cloud_done)
              ],
            ),
          ),
        ),
      ),
    );
  }

  simpanFollowUp() {
    // EasyLoading.showProgress(0.3, status: 'downloading...');
    EasyLoading.show(status: 'loading...');
    Map<String, String> body = {
      "id": data["id"].toString(),
      "penyebab": penyabab.text.toString(),
      "solusi": solusi.text.toString(),
      "close": status == false ? "1" : "0"
    };
    var routes = 'pengaduan-simpanFollowUpPengaduan';
    Api_.SaveImageToApi(
        body, _imagesebelum.path, _imagesesudah.path, routes, context);
  }

  getMasalah() {
    String ms = masalah.text.toString();
    setState(() {
      penyabab.text = ms.toString();
    });
  }
}
