import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/globalVar.dart';
import "package:timeago/timeago.dart" as timeago;

class TugasSelesai extends StatefulWidget {
  const TugasSelesai({key}) : super(key: key);

  @override
  _TugasSelesaiState createState() => _TugasSelesaiState();
}

class _TugasSelesaiState extends State<TugasSelesai> {
  // Future<List<dynamic>> _fecthDataUsers() async {
  //   // var result = await http.get(PostData.uri);
  //   // return json.decode(result.body)['data'];

  //   // return Api_.get("pengaduan-getKeluhanPasien");

  //   Uri uri =
  //       Uri.parse("http://192.168.137.1:3367/api/pengaduan-getKeluhanPasien");
  //   var result = await http.get(uri, headers: {
  //     'Authorization': "Bearer 234|nMVvKasZ3iOBgt4DclDtcfnIWyRB9JC6QNhXNw5X",
  //     "Accept": "application/json"
  //   });
  //   return json.decode(result.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RIWAYAT TUGAS"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // ignore: missing_required_param
              decoration: gradientColor(),
              child: FutureBuilder<List<dynamic>>(
                  future: Api_.getFuture(
                      "pengaduan-getKeluhanPasien-by-petugas?status=1"),
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
                                        onPressed: null,
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white,
                                        icon: Icons.view_carousel_sharp,
                                        label: 'Detail',
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    onLongPress: () {
                                      Var_id_detail =
                                          item.data[index]["id"].toString();
                                      Navigator.pushNamed(
                                          context, "/detail_tugas");
                                    },
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      // backgroundColor: Colors.brown.shade800,
                                      backgroundImage:
                                          AssetImage("assets/done.png"),
                                    ),
                                    title: Text(item.data[index]['unitkerja']),
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
                                            item.data[index]['isipengaduan'],
                                          ),
                                        ),
                                        Text(
                                          timeago.format(DateTime.parse(
                                              item.data[index]['created_at'])),
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
                  }),
            ),
          ),
          Container(
            height: 30,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.blueGrey[300],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Pastikan semua pekerjaan anda tidak ada yang pending .!")
              ],
            ),
          )
        ],
      ),
    );
  }
}
