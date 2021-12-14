import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: non_constant_identifier_names
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
            child: const Text('Aok aneh .'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

// ignore: non_constant_identifier_names
ShowToastr(String msg) {
  // ignore: non_constant_identifier_names
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 26.0);
}
