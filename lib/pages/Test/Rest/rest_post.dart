import 'dart:math';

import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/api/_randomstring.dart';
import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  TextEditingController sss = TextEditingController();

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
      "assignto": "1"
    };

    Api.post("pengaduan-simpanPengaduan", obj).then((val) {
      print(val['sts']);
      if (val["sts"] == 1) {
        Navigator.pushNamed(context, "/proses_pengaduan");
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
        body: Container(
          decoration: gradientColor(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(70, 20, 70, 0),
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
        ));
  }
}
