import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_api.dart';
import 'package:http/http.dart' as http;
import 'package:notification/service/globalVar.dart';

class DataPetugas extends StatefulWidget {
  const DataPetugas({key}) : super(key: key);

  @override
  _DataPetugasState createState() => _DataPetugasState();
}

class _DataPetugasState extends State<DataPetugas> {
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  List dataPetugas = List(0);

  _getData() async {
    EasyLoading.show(status: "Mohon Tunggu");
    var datas = await http.get(Uri.parse(baseUrl + "pengaduan-getpetugas"),
        headers: HeadersS);
    setState(() {
      dataPetugas = jsonDecode(datas.body);
      print(dataPetugas);
      EasyLoading.dismiss();
    });
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Petugas"),
      ),
      body: Container(
          decoration: gradientColor(),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              // ignore: missing_required_param
              decoration: gradientColor(),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: ListView.builder(
                    // padding: EdgeInsets.all(10),
                    itemCount: dataPetugas.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        decoration: BoxDecoration(
                            // color: Colors.blue[50],
                            border: Border.all(
                                width: 0.3, color: Colors.blue[300])),
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(baseUrlRoute +
                                  "/Users/" +
                                  dataPetugas[i]['foto'])),
                          onTap: () {
                            Var_id_pegawai = dataPetugas[i]["id"].toString();

                            Navigator.pushNamed(context, "/tugas_selesai");
                          },
                          title: Text(dataPetugas[i]['namapegawai']),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 220,
                                child: Text(
                                  dataPetugas[i]['role'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )
          ])),
    );
  }
}
