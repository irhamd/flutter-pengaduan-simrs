import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.pushNamed(context, '/hal');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(children: [
          Inputan("inputann11", null),
          Inputan("inputann11", null),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/rest_get");
              },
              child: Text("Rest Get")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/rest_post");
              },
              child: Text("Rest Post")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/camera");
              },
              child: Text("Camera"))
        ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
