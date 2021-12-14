import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProsesPengaduan extends StatefulWidget {
  const ProsesPengaduan({key}) : super(key: key);

  @override
  _ProsesPengaduanState createState() => _ProsesPengaduanState();
}

class _ProsesPengaduanState extends State<ProsesPengaduan> {
  var progres = "rq";

  static FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference root = db.collection("pengaduan");

  inputPesan() {
    return (TextField(
      onSubmitted: (value) {
        print("search");
      },
      decoration: InputDecoration(
        hintText: "Pesan anda...",
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon: Icon(
          Icons.message,
          color: Colors.grey.shade600,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade100)),
      ),
    ));
  }

  renderProgres() {
    if (progres == 'rq') {
      return (Container(
        child: Column(
          children: [
            SpinKitCircle(
              color: Colors.orange,
              size: 100.0,
            ),
            Text("Mencari petugas SIMRS .!"),
            br(100),
          ],
        ),
      ));
    } else {
      return (Container(
        child: Column(
          children: [
            Text("Sedang di proses oleh :"),
            br(10),
            CircleAvatar(
              radius: 60.0,
              // backgroundColor: Colors.brown.shade800,
              backgroundImage: AssetImage("assets/petugas.jpg"),
            ),
            Text(
              "AAn Rebahan, S.kom",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("10 minutes ago"),
            br(20),
          ],
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Ini tess firestore ajja")),
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: gradientColor(),
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            renderProgres(),
            Text(
              "SIMRS RUANGAN IRNA 1C TIDAK BISA KONEK",
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              padding: EdgeInsets.only(left: 2, right: 2, top: 13),
              child: Align(
                // alignment: (messages[index].messageType == "receiver"
                alignment: (Alignment.topLeft),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),

                        // bottomRight: Radius.circular(10.0)
                      ),
                      // color: (messages[index].messageType == "receiver"
                      //     ? Colors.grey.shade200
                      //     : Colors.blue[200]),
                      color: Colors.grey),
                  padding: EdgeInsets.all(13),
                  child: Text(
                    "Siap di cek mba",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 2, right: 2, top: 13),
              child: Align(
                // alignment: (messages[index].messageType == "receiver"
                alignment: (Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),

                        // bottomRight: Radius.circular(10.0)
                      ),
                      // color: (messages[index].messageType == "receiver"
                      //     ? Colors.grey.shade200
                      //     : Colors.blue[200]),
                      color: Colors.blue[400]),
                  padding: EdgeInsets.all(13),
                  child: Text(
                    "segera ya mass, karena masih banyak pasien belum pelayanan .!",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
            br(20),
            inputPesan(),
            br(10),
            Text("Dilihat oleh ::",
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                // backgroundColor: Colors.brown.shade800,
                backgroundImage: AssetImage("assets/sapri.png"),
              ),
              onTap: () {
                setState(() {
                  progres = "pr";
                });
              },
              onLongPress: () {},
              title: Text("Rattih Dian siap ini"),
              subtitle: Text("3 menit yang lalu"),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                // backgroundColor: Colors.brown.shade800,
                backgroundImage: AssetImage("assets/rattih.jpg"),
              ),
              onTap: () {
                setState(() {
                  progres = "pr";
                });
              },
              onLongPress: () {},
              title: Text("Nanang Hasanah"),
              subtitle: Text("3 menit yang lalu"),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                // backgroundColor: Colors.brown.shade800,
                backgroundImage: AssetImage("assets/nanang.jpg"),
              ),
              onTap: () {
                setState(() {
                  progres = "pr";
                });
              },
              onLongPress: () {},
              title: Text("Mantum"),
              subtitle: Text("3 menit yang lalu"),
            ),
          ],
        ),
      )),
    ));
  }
}
