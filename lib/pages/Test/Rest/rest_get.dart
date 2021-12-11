import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';

class RestGet extends StatefulWidget {
  const RestGet({key}) : super(key: key);

  @override
  _RestGetState createState() => _RestGetState();
}

class _RestGetState extends State<RestGet> {
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(PostData.uri);
    print(json.decode(result.body)['data']);
    return json.decode(result.body)['data'];
  }

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
            future: _fecthDataUsers(),
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
                              dismissible: DismissiblePane(onDismissed: () {}),
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
                              title: Text("IRNA 1C"),
                              subtitle: Text(
                                  "Komputer tidak bisa konnek karena apa munkin penyebabnya broo. "),
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
