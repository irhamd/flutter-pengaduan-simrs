import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:flutter/material.dart';

class RestPost extends StatefulWidget {
  const RestPost({key}) : super(key: key);

  @override
  _RestPostState createState() => _RestPostState();
}

class _RestPostState extends State<RestPost> {
  int hargaB = 0;
  String nama = "2";

  // TextEditingController namapekerjaan = TextEditingController();
  // TextEditingController sss = TextEditingController();

  TextEditingController sss = TextEditingController();

  void _simpanData() {
    print(sss.text.toString());
    // PostData.simpanData({"banaa": "dddd"});
    PostData.simpanDataDB({
      "id": sss.text.toString(),
      "jenis": "tender",
      "jenispekerjaan": "3",
      "namapekerjaan": "bebeass",
      "tahunanggaran": "2021"
    }).then((val) {
      print(val["sts"]);
    });
  }

  renderTombol(String icon, title) {
    return Column(
      children: [
        (ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: 100.0,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              ShowMessage(
                  "Mohon Tunggu, Permintaan anda sudah di kirim ke simrs",
                  context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/" + icon + ".png",
                    width: 90,
                  ),
                  br(),
                  Text(title),
                ],
              ),
            ),
          ),
        )),
        br(),
        br(),
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
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Column(
              children: <Widget>[
                Text(
                  " SIMRS melayani dengan hati dan mengangani dengan b3c@t .!",
                  textAlign: TextAlign.center,
                ),
                br(),
                renderTombol("error", "SIMRS ERROR"),
                renderTombol("no-internet", "JARINGAN TIDAK KONEK"),
                renderTombol("devices", "ALAT KANTOR TROUBLE"),
                Text(
                  "Ⓒ2021 copyright simrs-rsudkotamataram",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
        ));
  }
}
