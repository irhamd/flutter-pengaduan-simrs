import 'package:flutter/material.dart';

ShowMessage(String msg, BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(msg.toString()),
        content: SingleChildScrollView(),
        actions: <Widget>[
          TextButton(
            child: const Text('Oke Bro'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
