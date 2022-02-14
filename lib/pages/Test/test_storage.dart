import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class TestStorage extends StatefulWidget {
  const TestStorage({key}) : super(key: key);

  @override
  _TestStorageState createState() => _TestStorageState();
}

class _TestStorageState extends State<TestStorage> {
  final LocalStorage storage = new LocalStorage('todo_app');

  _saveToStorage() {
    storage.setItem('nohp', "wwwwww");
  }

  _loadStorage() {
    storage.getItem('nohp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DDDD"),
      ),
      body: Column(
        children: [
          Text(storage.getItem("nohp") != null ? storage.getItem("nohp") : ""),
          ElevatedButton(onPressed: _saveToStorage, child: Text("Simpan"))
        ],
      ),
    );
  }
}
