import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notification/pages/home/dashboard.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/globalVar.dart';
import "package:timeago/timeago.dart" as timeago;
import "package:http/http.dart" as http;

class TugasPending extends StatefulWidget {
  const TugasPending({key}) : super(key: key);

  @override
  _TugasPendingState createState() => _TugasPendingState();
}

class _TugasPendingState extends State<TugasPending> {
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  final dash = Dashboard();
  List data = List(0);

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
      setState(() {
        selectedDate = picked;
        this.getData();
        _tanggal = picked.toString().substring(0, 10);
        _dateController.text = DateFormat("dd-MMMM-yyyy").format(selectedDate);
      });
    }
  }

  Future<String> getData() async {
    EasyLoading.show(status: "Mohon Tunggu");
    var datas = await http.get(
        Uri.parse(baseUrl +
            "pengaduan-getKeluhanPasien-by-petugas?status=0&tanggal1=" +
            selectedDate.toString().substring(0, 10)),
        headers: HeadersS);
    setState(() {
      data = jsonDecode(datas.body);
      EasyLoading.dismiss();
    });
    return "Success!";
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
        onTap: (value) =>
            {if (value == 1) Navigator.pushNamed(context, "/tugas_selesai")},
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
          // InkWell(
          //   onTap: () {
          //     _selectDate(context);
          //   },
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height / 12,
          //     alignment: Alignment.center,
          //     child: TextFormField(
          //         enabled: false,
          //         keyboardType: TextInputType.text,
          //         controller: _dateController,
          //         onSaved: (String val) {
          //           _setDate = val;
          //         },
          //         decoration: InputDecoration(
          //           prefixIcon: Icon(Icons.date_range),
          //           labelText: "Tanggal",
          //           filled: true,
          //           fillColor: Colors.blue[50],
          //         )),
          //   ),
          // ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              // ignore: missing_required_param
              decoration: gradientColor(),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: ListView.builder(
                    // padding: EdgeInsets.all(10),
                    itemCount: data.length,
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
                              ],
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30.0,
                                // backgroundColor: Colors.brown.shade800,
                                backgroundImage: AssetImage("assets/power.png"),
                              ),
                              onTap: () {
                                Var_keluhan = jsonEncode(data[index]);
                              },
                              onLongPress: () {
                                Var_keluhan = jsonEncode(data[index]);
                                Navigator.pushNamed(context, "/follow_up");
                              },
                              title: Text(data[index]['unitkerja']),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 220,
                                    child: Text(
                                      data[index]['isipengaduan'],
                                    ),
                                  ),
                                  Text(
                                    timeago.format(DateTime.parse(
                                        data[index]['created_at'])),
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            )),
                      );
                    }),
              ),
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
