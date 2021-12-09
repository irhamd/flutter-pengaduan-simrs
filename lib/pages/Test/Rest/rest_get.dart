import 'package:applikasi_pelaporan_simrs/pages/Test/Rest/rest_post.dart';
import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestGet extends StatefulWidget {
  const RestGet({key}) : super(key: key);

  @override
  _RestGetState createState() => _RestGetState();
}

class _RestGetState extends State<RestGet> {
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(PostData.uri);
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ini resss"),
      ),
      body: Container(
        // ignore: missing_required_param
        child: FutureBuilder<List<dynamic>>(
            future: _fecthDataUsers(),
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot item) {
              if (item.hasData) {
                return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: item.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(item.data[index]['avatar']),
                        ),
                        onTap: () {},
                        onLongPress: () {
                          print(item.data[index]["first_name"]);
                        },
                        title: Text(item.data[index]['first_name'] +
                            " " +
                            item.data[index]['last_name']),
                        subtitle: Text(item.data[index]['email']),
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
