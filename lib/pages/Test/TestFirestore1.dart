import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TestFirestore1 extends StatefulWidget {
  const TestFirestore1({key}) : super(key: key);

  @override
  _TestFirestore1State createState() => _TestFirestore1State();
}

class _TestFirestore1State extends State<TestFirestore1> {
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
            height: 500,
            decoration: gradientColor(),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('pengaduan')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  EasyLoading.showInfo("update");
                  print(snapshot.data.docs.length);
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length ?? 0,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data.docs[index];
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
                                backgroundImage: AssetImage("assets/power.png"),
                              ),
                              title: Text(doc['keluhan']),
                              subtitle: Text(doc["unitkerja"]),
                            ),
                          ),
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

void acceptTugas(BuildContext context) {
  Navigator.pushNamed(context, "/camera");
}
