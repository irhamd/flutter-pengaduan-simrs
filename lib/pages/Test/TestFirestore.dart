import 'dart:convert';

import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/api/_api.dart';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import "package:timeago/timeago.dart" as timeago;

class TestFirestore extends StatefulWidget {
  const TestFirestore({key}) : super(key: key);

  @override
  _TestFirestoreState createState() => _TestFirestoreState();
}

class _TestFirestoreState extends State<TestFirestore> {
  // static FirebaseFirestore fire = FirebaseFirestore.instance;
  static FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference root = db.collection("pengaduan");

  final List bulan = [
    {"bulan": "Januari", "title": "ini bulan keberutungan"}
  ];

  var dataKeluhan = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
    ShowToastr("oke brooo");
  }

  // ElevatedButton(
  //   onPressed: () {
  //     root.add({"keluhan": "bebeass", "unit kerja": "irna 3C"});
  //   },
  //   child: Text("Insert")),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ini tess firestore ajja")),
      body: Column(
        children: [
          Container(
            // height: 500,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: gradientColor(),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('pengaduan')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  EasyLoading.showInfo("update");
                  return (FutureBuilder<List<dynamic>>(
                      future: Api_.getFuture(
                          "pengaduan-getKeluhanPasien-by-petugas?status=0"),
                      // ignore: missing_return
                      builder: (BuildContext context, AsyncSnapshot item) {
                        if (item.hasData) {
                          return ListView.builder(
                              // padding: EdgeInsets.all(10),
                              itemCount: item.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      // color: Colors.blue[50],
                                      border: Border.all(
                                          width: 0.3, color: Colors.blue[300])),
                                  child: Slidable(
                                      key: const ValueKey(0),
                                      startActionPane: ActionPane(
                                        // dismissible: DismissiblePane(onDismissed: () {}),
                                        motion: const ScrollMotion(),
                                        children: const [
                                          SlidableAction(
                                            onPressed: acceptTugas,
                                            backgroundColor: Colors.green,
                                            foregroundColor: Colors.white,
                                            icon: Icons.control_point_duplicate,
                                            label: 'Accept',
                                          ),
                                          SlidableAction(
                                            onPressed: null,
                                            backgroundColor: Colors.red,
                                            foregroundColor: Colors.white,
                                            icon: Icons.low_priority,
                                            label: 'Reject',
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 30.0,
                                          // backgroundColor: Colors.brown.shade800,
                                          backgroundImage:
                                              AssetImage("assets/power.png"),
                                        ),
                                        onTap: () {
                                          Var_keluhan =
                                              jsonEncode(item.data[index]);
                                        },
                                        onLongPress: () {
                                          Var_keluhan =
                                              jsonEncode(item.data[index]);
                                          Navigator.pushNamed(
                                              context, "/camera");
                                        },
                                        title:
                                            Text(item.data[index]['unitkerja']),
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  220,
                                              child: Text(
                                                item.data[index]
                                                    ['isipengaduan'],
                                              ),
                                            ),
                                            Text(
                                              timeago.format(DateTime.parse(item
                                                  .data[index]['created_at'])),
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              });
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                root.add({"keluhan": "bebeass", "unitkerja": "irna 3C"});
              },
              child: Text("Insert")),
        ],
      ),
    );
  }
}

void acceptTugas(BuildContext context) {
  Navigator.pushNamed(context, "/camera");
}
