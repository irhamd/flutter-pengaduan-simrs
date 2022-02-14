import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notification/service/_input.dart';
import 'package:notification/service/_messageDialog.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_randomstring.dart';
import 'package:notification/service/api/api_post.dart';
import 'package:notification/service/forms/_Button.dart';
import 'package:notification/service/globalVar.dart';

class RestPost extends StatefulWidget {
  const RestPost({key}) : super(key: key);

  @override
  _RestPostState createState() => _RestPostState();
}

class _RestPostState extends State<RestPost> {
  int hargaB = 0;
  String nama = "2";
  String ruangan = "Irna 3B";

  // TextEditingController namapekerjaan = TextEditingController();
  // TextEditingController sss = TextEditingController();

  TextEditingController lainnya = TextEditingController();

  List _valFriends = [
    "Irna 1A",
    "Irna 1B",
    "Irna 2",
    "Irna 3A",
    "Irna 3B",
    "Irna 3C",
    "Nifas",
    "Nicu",
    "Picu",
  ];

  void _simpanData(String isipengaduan) {
    ShowToastr(Var_phoneNumber);
    Var_ruangan_pengaduan = "Ruangan " + ruangan;
    Var_isi_pengaduan = isipengaduan;

    Object obj = {
      "unitkerja": Var_ruangan_pengaduan,
      "nomorpengaduan": GetRandomString(7),
      "nohp": Var_phoneNumber,
      "isipengaduan": Var_isi_pengaduan,
      // "assignto": "1"
    };
    Navigator.pushNamed(context, "/proses_pengaduan");

    Api.post("pengaduan-simpanPengaduan", obj).then((val) {
      if (val["sts"] == 1) {
        Var_idpengaduan = val["id"].toString();
        // ShowMessage("Mohon Tunggu, keluhan anda sedang di proses ...", context);
      }
    });
  }

  renderTombol(String icon, title) {
    return Column(
      children: [
        ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: 100.0,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              _simpanData(title);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/" + icon + ".png",
                    width: 60,
                  ),
                  br(null),
                  Text(title),
                ],
              ),
            ),
          ),
        ),
        br(null),
        br(null),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("APA KELUHAN ANDA ?"),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: gradientColor(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: Column(
                children: <Widget>[
                  Text(
                    " SIMRS melayani dengan hati dan mengangani dengan b3c@t .!",
                    textAlign: TextAlign.center,
                  ),
                  br(null),
                  renderTombol("error", "SIMRS ERROR"),
                  renderTombol("no-internet", "JARINGAN TIDAK KONEK"),
                  renderTombol("devices", "ALAT KANTOR TROUBLE"),
                  Inputan("Lainnya ( Diketik secara spesifik) ", lainnya),
                  br(15),
                  Padding(
                    padding: EdgeInsets.only(left: 60, right: 60),
                    child: Button_(() {}, " Kirim", Icons.send_rounded),
                  ),
                  br(20),
                  Text(
                    "Ⓒ2021 copyright simrs-rsudkotamataram",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  DropdownButton(
                    hint: Text("Ruangan anda"),
                    value: "Irna 3B",
                    items: _valFriends.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        ruangan = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
