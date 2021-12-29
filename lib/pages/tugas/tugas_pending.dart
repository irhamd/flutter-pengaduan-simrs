import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notification/pages/home/dashboard.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/forms/_Button.dart';
import 'package:notification/service/globalVar.dart';
import "package:timeago/timeago.dart" as timeago;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TugasPending extends StatefulWidget {
  const TugasPending({key}) : super(key: key);

  @override
  _TugasPendingState createState() => _TugasPendingState();
}

class _TugasPendingState extends State<TugasPending> {
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

  final dash = Dashboard();
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<List<dynamic>> inifuture;

  String _setTime, _tanggal, _setDate;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2021),
        lastDate: DateTime(2101));
    if (picked != null) {
      // var tanggal = picked.toString();
      // print(tanggal.substring(0, 10));
      setState(() {
        selectedDate = picked;
        _tanggal = picked.toString().substring(0, 10);
        _dateController.text = DateFormat.yMMMMd().format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6bceff),
        onPressed: () {
          Navigator.pushNamed(context, "/tugas_pending");
        },
        child: Icon(Icons.speaker_phone, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          // EasyLoading.showInfo(value.toString()),
          // if (value == 0) Navigator.pushNamed(context, "tugas_pending"),
          if (value == 1) Navigator.pushNamed(context, "/tugas_selesai")
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rotate_90_degrees_ccw,
              color: Color(0xff6bceff),
            ),
            title: Text(
              'Pending',
              style: TextStyle(
                color: Color(0xff6bceff),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text('Riwayat Tugas'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("TUGAS UNTUK ANDA"),
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 12,
              // margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              // decoration: BoxDecoration(color: Colors.grey[200]),
              child: TextFormField(
                  // style: TextStyle(fontSize: 40),
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _dateController,
                  onSaved: (String val) {
                    _setDate = val;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    labelText: "Tanggal",
                    filled: true,
                    fillColor: Colors.blue[50],
                  )
                  // decoration: InputDecoration(
                  //     disabledBorder:
                  //         UnderlineInputBorder(borderSide: BorderSide.none),
                  //     contentPadding: EdgeInsets.only(top: 0.0)),
                  ),
            ),
          ),
          Button_(() {
            EasyLoading.showError("cekk");
            FutureBuilder<List<dynamic>>(
                future: Api_.getFuture(
                    "pengaduan-getKeluhanPasien-by-petugas?status=0&tanggal=" +
                        selectedDate.toString().substring(0, 10)),
                // ignore: missing_return
                builder: (context, snapshot) {});
          }, " Refresh", Icons.refresh),
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(10),
              // ignore: missing_required_param
              decoration: gradientColor(),
              child: FutureBuilder<List<dynamic>>(
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
                                      // SlidableAction(
                                      //   onPressed: null,
                                      //   backgroundColor: Colors.red,
                                      //   foregroundColor: Colors.white,
                                      //   icon: Icons.low_priority,
                                      //   label: 'Reject',
                                      // ),
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
                                          context, "/follow_up");
                                    },
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

// ignore: missing_return
String acceptTugas(context) {
  Navigator.pushNamed(context, "/follow_up");
}
