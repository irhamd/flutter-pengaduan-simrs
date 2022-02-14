import 'package:flutter/material.dart';

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.blue[100],
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
          // readOnly: true,
          controller: ctr,
          minLines: 1, //Normal textInputField will be displayed
          maxLines: 15, // whe
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.chevron_left),
            labelText: label,
            filled: true,
            fillColor: Colors.blue[50],
            enabledBorder: myinputborder(),
            focusedBorder: myfocusborder(),
          ))
    ],
  ));
}

br(double height) {
  return (SizedBox(height: height != null ? height : 10));
}

ButtonNavigasi() {
  return ([
    BottomNavigationBarItem(
        icon: Icon(
          Icons.rotate_90_degrees_ccw,
          color: Color(0xff6bceff),
        ),
        label: 'Pending'),
    BottomNavigationBarItem(
        icon: Icon(Icons.playlist_add_check), label: 'Riwayat Tugas'),
  ]);
}
