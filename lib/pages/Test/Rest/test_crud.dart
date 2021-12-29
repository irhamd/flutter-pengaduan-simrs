import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';

class CRUD extends StatefulWidget {
  const CRUD({key}) : super(key: key);

  @override
  _CRUDState createState() => _CRUDState();
}

class _CRUDState extends State<CRUD> {
  List data;
  String _setTime, _setDate;
  DateTime selectedDate = DateTime.now();

  TextEditingController _dateController = TextEditingController();

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
        _dateController.text = DateFormat.yMMMMd().format(selectedDate);
        print(picked);
        getData();
      });
    }
  }

  Future<String> getData() async {
    EasyLoading.show(status: "Mohon Tunggu");
    var datas = await http.get(
        Uri.parse(
            "http://10.10.102.3:3367/api/pengaduan-getKeluhanPasien-by-petugas?status=0&tanggal=" +
                selectedDate.toString().substring(0, 10)),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer 478|sdgZKyWODjhYxG0NLp2jYDJZFbcO0PV8z9RydH7W"
        });
    setState(() {
      data = jsonDecode(datas.body);
      EasyLoading.dismiss();
    });
    return "Success!";
  }

  Future<String> getData1() async {
    http.Response response = await http.get(
        Uri.parse(
            "http://10.10.102.3:3367/api/pengaduan-getKeluhanPasien-by-petugas?status=0&tanggal=2021-12-27"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer 478|sdgZKyWODjhYxG0NLp2jYDJZFbcO0PV8z9RydH7W"
        });
    setState(() {
      data = jsonDecode(response.body);
    });
    return "Success!";
  }

  @override
  void initState() {
    // this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CRUD"),
        ),
        body: Column(
          children: [
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
            ElevatedButton(
                onPressed: () {
                  this.getData();
                },
                child: Text("Refreshh")),
            ElevatedButton(
                onPressed: () {
                  this.getData1();
                },
                child: Text("Refreshh1")),
            Container(
                decoration: BoxDecoration(color: Colors.orange),
                height: MediaQuery.of(context).size.height / 1.6,
                child: ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Text("$index. " + data[index]["unitkerja"]),
                    );
                  },
                )),
          ],
        ));
  }
}
