import 'dart:async';
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:notification/service/_input.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/forms/_Button.dart';
import 'package:notification/service/forms/_dropdown_search.dart';
import 'package:notification/service/globalVar.dart';
import "package:http/http.dart" as http;

class InputTugas extends StatefulWidget {
  const InputTugas({key}) : super(key: key);

  @override
  InputTugasState createState() => InputTugasState();
}

class InputTugasState extends State<InputTugas> {
  File _imagesebelum;
  File _imagesesudah;
  TextEditingController permasalahan = TextEditingController();
  TextEditingController penyabab = TextEditingController();
  TextEditingController solusi = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController ruangan = TextEditingController();

  // penyabab,
  // solusi,
  // nama,
  // keterangan,
  // ruangan,
  // nohp

  List dataRuangan = [];

  final imagePicker = ImagePicker();

  Future getImageSebelum() async {
    final gambar = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      _imagesebelum = File(gambar.path);
    });
  }

  _getFromGallery(String jj) async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      switch (jj) {
        case "sebelum":
          setState(() {
            _imagesebelum = File(pickedFile.path);
          });
          break;
        case "sesudah":
          setState(() {
            _imagesesudah = File(pickedFile.path);
          });
          break;
      }
    }
  }

  Future getImageCamera(jj) async {
    final gambar = await imagePicker.getImage(source: ImageSource.camera);
    if (gambar != null) {
      switch (jj) {
        case "sebelum":
          setState(() {
            _imagesebelum = File(gambar.path);
          });
          break;
        case "sesudah":
          setState(() {
            _imagesesudah = File(gambar.path);
          });
          break;
      }
    }
  }

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Input Tugas")),
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
                  permasalahan,
                ),
                Inputan(
                  "Nomor HP",
                  nohp,
                ),
                Inputan(
                  "Nama penanggung jawab",
                  nama,
                ),
                Inputan(
                  "Ruangan",
                  ruangan,
                ),
                Inputan("Penyebab", penyabab),
                Inputan("Solusi", solusi),
                Inputan("Keterangan", keterangan),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // _showMyDialog("dddd", context);
                          getImageCamera("sebelum");
                        },
                        child: Center(
                          child: Align(
                            alignment: Alignment
                                .center, // Align however you like (i.e .centerRight, centerLeft)
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt),
                                Text(" Camera"),
                              ],
                            ),
                          ),
                        )),
                    Text(" "),
                    ElevatedButton(
                        onPressed: () {
                          // _showMyDialog("dddd", context);
                          // _getFromGallery();
                          _getFromGallery("sebelum");
                        },
                        child: Center(
                          child: Align(
                            alignment: Alignment
                                .center, // Align however you like (i.e .centerRight, centerLeft)
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image),
                                Text(" Gallery"),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                br(null),
                _imagesesudah == null
                    ? Text("belum ada gambar setelah")
                    : Image.file(_imagesesudah),
                br(null),
                Text("Foto sesudah "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // _showMyDialog("dddd", context);
                          getImageCamera("sesudah");
                        },
                        child: Center(
                          child: Align(
                            alignment: Alignment
                                .center, // Align however you like (i.e .centerRight, centerLeft)
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt),
                                Text(" Camera"),
                              ],
                            ),
                          ),
                        )),
                    Text(" "),
                    ElevatedButton(
                        onPressed: () {
                          // _showMyDialog("dddd", context);
                          _getFromGallery("sesudah");
                        },
                        child: Center(
                          child: Align(
                            alignment: Alignment
                                .center, // Align however you like (i.e .centerRight, centerLeft)
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image),
                                Text(" Gallery"),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                Button_(save, " Simpan", Icons.cloud_done)
              ],
            ),
          ),
        ),
      ),
    );
  }

  save() {
    try {
      // EasyLoading.showProgress(0.3, status: 'downloading...');
      EasyLoading.show(status: 'loading...');
      Map<String, String> body = {
        "nohp": nohp.text.toString(),
        "unitkerja": ruangan.text.toString(),
        "isipengaduan": permasalahan.text,
        "solusi": solusi.text.toString(),
        "keterangan": keterangan.text.toString(),
        "penyebab": penyabab.text.toString(),
        "nama": nama.text.toString()
      };

      // print(body.toString());

      var routes = 'pengaduan-simpanInputPengaduan';
      Api_.SaveImageToApi(
          body, _imagesebelum.path, _imagesesudah.path, routes, context);
    } catch (e) {
      EasyLoading.showError("Gagal simpan data ...");
      print(e.toString());
    }
  }

  getMasalah() {
    String ms = permasalahan.text.toString();
    setState(() {
      penyabab.text = ms.toString();
    });
  }
}
