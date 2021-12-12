import 'dart:convert';

import 'package:applikasi_pelaporan_simrs/service/api/_api.dart';
import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import "package:timeago/timeago.dart" as timeago;

class RestGet extends StatefulWidget {
  const RestGet({key}) : super(key: key);

  @override
  _RestGetState createState() => _RestGetState();
}

class _RestGetState extends State<RestGet> {
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
        title: Text("TUGAS UNTUK ANDA"),
      ),
      body: Container(
        // ignore: missing_required_param
        decoration: gradientColor(),
        child: FutureBuilder<List<dynamic>>(
            future: Api_.getFuture("pengaduan-getKeluhanPasien"),
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
                                backgroundImage: AssetImage("assets/power.png"),
                              ),
                              onTap: () {},
                              onLongPress: () {},
                              title: Text(item.data[index]['unitkerja']),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 220,
                                    child: Text(
                                      item.data[index]['isipengaduan'],
                                    ),
                                  ),
                                  Text(
                                    timeago.format(DateTime.parse(
                                        item.data[index]['created_at'])),
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
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
    );
  }
}

void acceptTugas(BuildContext context) {
  Navigator.pushNamed(context, "/camera");
}
