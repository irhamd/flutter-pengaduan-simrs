import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_number/mobile_number.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notification/service/_input.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/globalVar.dart';

class ProsesPengaduan extends StatefulWidget {
  const ProsesPengaduan({key}) : super(key: key);

  @override
  _ProsesPengaduanState createState() => _ProsesPengaduanState();
}

class _ProsesPengaduanState extends State<ProsesPengaduan> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  static get http => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.showInfo(Var_idpengaduan);
  }

  var progres = "11";
  var _nomorpengaduan = "11223442";

  static TextEditingController inputChat = TextEditingController();

  inputPesan() {
    return (TextField(
      controller: inputChat,
      onSubmitted: (value) {
        if (value != "") {
          inputChat.text = "";
        }
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

  alignKanan(String pesan, waktu) {
    return (Align(
      alignment: (Alignment.topRight),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color: Colors.blue[400]),
            padding: EdgeInsets.all(13),
            child: Text(
              pesan,
              style: TextStyle(fontSize: 15),
            ),
          ),
          // Text(
          //   timeago.format(DateTime.parse(waktu)),
          //   textAlign: TextAlign.start,
          //   style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
          // ),
        ],
      ),
    ));
  }

  alignKiri(String pesan, waktu) {
    return (Align(
      // alignment: (messages[index].messageType == "receiver"
      alignment: (Alignment.centerLeft),
      child: Column(
        children: [
          Container(
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
              pesan,
              style: TextStyle(fontSize: 15),
            ),
          ),
          // Text(
          //   timeago.format(DateTime.parse(waktu)),
          //   textAlign: TextAlign.start,
          //   style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
          // ),
        ],
      ),
    ));
  }

  renderProgres() {
    if (progres == '11') {
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
            Text("Akan ditangani oleh  :"),
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

  static getData(String route) async {
    //   Uri uri = Uri.parse(baseUrl + route);
    //   var result = await http.get(uri, headers: _headers);
    //   return json.decode(result.body);
    // }

    Uri uri = Uri.parse(baseUrl + route);
    var result = await http.get(
      uri,
      // headers = {
      //   "Authorization": "Bearer 311|dbT6OvrzcaUYK3KAyYdQ7uiLu8Ag84cOPdukyQCG"
      // }
    );
    Map hasil = json.decode(result.body);
    print(hasil);
    // print(hasil);
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: gradientColor(),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  renderProgres(),
                  Text(
                    Var_phoneNumber,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    Var_isi_pengaduan,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    Var_ruangan_pengaduan,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  br(20),
                  br(10),
                  // fillCards(),
                  renderDilihatOleh(),
                  br(10),
                  inputPesan(),
                ],
              ),
            )),
          )),
        ],
      ),
    );
  }

  renderDilihatOleh() {
    return (Container(
        child: Column(
      children: [
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
    )));
  }
}
