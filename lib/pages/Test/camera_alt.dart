import 'dart:async';

import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TestCamera extends StatefulWidget {
  const TestCamera({key}) : super(key: key);

  @override
  TestCameraState createState() => TestCameraState();
}

class TestCameraState extends State<TestCamera> {
  File _imagesebelum;
  File _imagesesudah;
  TextEditingController masalah = TextEditingController();
  TextEditingController jika = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
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
                Inputan("Permasalahan", masalah),
                Inputan("Penyebab", jika),
                br(),
                _imagesebelum == null
                    ? Text("belum ada gambar sebelum")
                    : Image.file(_imagesebelum),
                br(),
                Text("Foto sebelum "),
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
                            Text("Ambil gambar"),
                          ],
                        ),
                      ),

                      // Row(
                      //   children: [
                      //     Text("Ambil gambar"),
                      //     Icon(Icons.camera_alt),
                      //   ],
                      // ),
                      // Text( Center(
                      //   chil
                      //   "Ambil gambar ",
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(fontStyle: FontStyle.normal),
                      // )
                      // ),
                    )),
                br(),
                _imagesesudah == null
                    ? Text("belum ada gambar setelah")
                    : Image.file(_imagesesudah),
                br(),
                Text("Foto sesudah "),
                ElevatedButton(
                    onPressed: () {
                      // _showMyDialog("dddd", context);
                      getImageSesudah();
                    },
                    child: Icon(Icons.camera_alt)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getMasalah() {
    String ms = masalah.text.toString();
    setState(() {
      jika.text = ms.toString();
    });
  }
}
