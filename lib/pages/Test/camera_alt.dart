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
  TextEditingController masalah = TextEditingController();
  TextEditingController jika = TextEditingController();

  final imagePicker = ImagePicker();

  Future getImage() async {
    final gambar = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      _imagesebelum = File(gambar.path);
    });
  }

  getGradien() {
    return (Container(decoration: gradientColor()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(title: Text("Input Visite"), flexibleSpace: getGradien()),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: gradientColor(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Inputan("Permasalahan", masalah),
                Inputan("Penyebab", jika),
                Text("Foto sebelum "),
                br(),
                _imagesebelum == null
                    ? Text("belum ada gambar")
                    : Image.file(_imagesebelum),
                Text("Foto sesudah "),
                ElevatedButton(
                    onPressed: () {
                      // _showMyDialog("dddd", context);
                      getImage();
                    },
                    child: Icon(Icons.camera_alt)),
                ElevatedButton(
                    onPressed: () {
                      getMasalah();
                    },
                    child: Icon(Icons.search))
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
