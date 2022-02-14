import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:notification/service/_input.dart';
import "package:http/http.dart" as http;
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/globalVar.dart';
import "package:timeago/timeago.dart" as timeago;

class DetailTugas extends StatefulWidget {
  const DetailTugas({key}) : super(key: key);

  @override
  _DetailTugasState createState() => _DetailTugasState();
}

class _DetailTugasState extends State<DetailTugas> {
  Map detail = Map();
  String routes;
  @override
  void initState() {
    _getDetailData();
    super.initState();
  }

  _getDetailData() async {
    try {
      EasyLoading.show(status: "Mohon Tunggu");
      var datas = await http.get(
          Uri.parse(baseUrl + "pengaduan-detailTugas?id=$Var_id_detail"),
          headers: HeadersS);
      setState(() {
        detail = jsonDecode(datas.body);
        print(detail);
        EasyLoading.dismiss();
      });
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
    }

    return "Success!";
  }

  // pengaduan-detailTugas

  _label(title, value) {
    return Column(
      children: [
        br(10),
        Text(
          title,
          textAlign: TextAlign.left,
        ),
        Text(
          detail != null ? detail[value].toString() : "",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Divider(color: Colors.grey),
      ],
    );
  }

  _labelFoto(title, value) {
    return Column(
      children: [
        br(10),
        Text(
          title,
          textAlign: TextAlign.left,
        ),
        br(10),
        Image.network(
          baseUrlRoute + "/Pengaduan/" + detail[value],
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
            return CircularProgressIndicator();
          },
        ),
        Divider(color: Colors.grey),
      ],
    );
  }

  _labelDate(title, value) {
    return Column(
      children: [
        br(10),
        Text(
          title,
          textAlign: TextAlign.left,
        ),
        Text(
          detail != null
              ? DateFormat('dd-MM-yyyy HH:mm')
                  .format(DateTime.parse(detail[value]))
              : "",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Divider(color: Colors.grey),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Tugas"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              br(20),
              Column(
                children: [
                  _label("Nomor Pengaduan", 'nomorpengaduan'),
                  _labelDate("Tanggal Pengaduan", 'created_at'),
                  _labelDate("Tanggal Selesai", 'waktu_selesai'),
                  _label("Ruangan", 'unitkerja'),
                  _label("Nama", 'nama'),
                  _label("Petugas Pelaksana", 'namapegawai'),
                  _label("Isi Pengaduan", 'isipengaduan'),
                  _label("Penyebab", 'penyebab'),
                  _labelFoto("Foto Sebelum", 'foto_sebelum'),
                  _labelFoto("Foto Sesudah", 'foto_sesudah'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Kembali"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
