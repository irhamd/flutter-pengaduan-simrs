import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notification/service/_messageDialog.dart';

class HalamanHorizontal extends StatefulWidget {
  const HalamanHorizontal({key}) : super(key: key);

  @override
  _HalamanHorizontalState createState() => _HalamanHorizontalState();
}

class _HalamanHorizontalState extends State<HalamanHorizontal> {
  static const List<String> _razas = const [
    "Schnauzer",
    "Ovejero Alemán",
    "Husky",
    "Brasov",
    "Constanta",
    "Mestizo"
  ];

  bool _lights = false;
  String razasValue = _razas[0];

  TextEditingController isiText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ini halaman scrolbar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButton(
                  value: razasValue,
                  onChanged: (string) => setState(() {
                    isiText.text = string;
                    razasValue = string;
                  }),
                  items: _razas.map((string) {
                    return DropdownMenuItem(
                      child: Text(
                        string,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: string,
                    );
                  }).toList(),
                ),
                //
                SwitchListTile(
                  title: const Text('Lights'),
                  value: _lights,
                  onChanged: (bool value) {
                    ShowMessage("Ini message", context);
                    setState(() {
                      _lights = value;
                    });
                  },
                  secondary: const Icon(Icons.lightbulb_outline),
                ),
                //
                TextField(
                  controller: isiText,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    fillColor: Colors.orange,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                //
                ElevatedButton(
                  onPressed: () {
                    ShowMessage("Bebasss", context);
                  },
                  child: Text("cek Tombol"),
                )
              ],
            )),
      ),
    );
  }
}
