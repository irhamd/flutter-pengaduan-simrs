import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
            height: 200,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('pengaduan')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.docs.length);
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length ?? 0,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data.docs[index];
                        return ListTile(
                          leading: CircleAvatar(),
                          title: Text(doc['keluhan']),
                          subtitle: Text(doc["unitkerja"]),
                        );
                      });
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
