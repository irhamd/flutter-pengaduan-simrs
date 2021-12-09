import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ini rest post"),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            children: <Widget>[
              // TextField(
              //   controller: sss,
              // ),
              Inputan("ID", sss),
              // TextFieldPlus(
              //   controller: sss,
              //   padding: EdgeInsets.symmetric(horizontal: 8),
              //   margin: EdgeInsets.only(top: 10),
              //   height: 60,
              //   backgroundColor: Colors.black12,
              //   enabled: true,
              //   placeholder: TextPlus(
              //     'ID',
              //     color: Colors.black38,
              //   ),
              //   prefixWidget: Icon(
              //     Icons.addchart,
              //   ),
              // ),
              TextFieldPlus(
                // controller: namapekerjaan,
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.only(top: 10),
                height: 60,
                backgroundColor: Colors.black12,
                enabled: true,
                placeholder: TextPlus(
                  'ID',
                  color: Colors.black38,
                ),
                prefixWidget: Icon(
                  Icons.format_align_right,
                ),
              ),
              ElevatedButton(onPressed: _simpanData, child: Text("Simpan"))
            ],
          ),
        ));
  }
}
