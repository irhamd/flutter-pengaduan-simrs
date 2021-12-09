import 'package:flutter/material.dart';

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 1,
      ));
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.blue[200],
        width: 1,
      ));
}

// ignore: non_constant_identifier_names
Inputan(String label, TextEditingController ctr) {
  return (Column(
    children: [
      SizedBox(height: 10),
      TextField(
          controller: ctr,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.format_align_right),
            labelText: label,
            filled: true,
            fillColor: Colors.blue[50],
            enabledBorder: myinputborder(),
            focusedBorder: myfocusborder(),
          ))
    ],
  ));
}

br() {
  return (SizedBox(height: 10));
}
