import 'package:flutter/material.dart';
import 'package:notification/service/_warna.dart';

class DataPetugas extends StatefulWidget {
  const DataPetugas({key}) : super(key: key);

  @override
  _DataPetugasState createState() => _DataPetugasState();
}

class _DataPetugasState extends State<DataPetugas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Petugas"),
      ),
      body: Container(
        decoration: gradientColor(),
      ),
    );
  }
}
