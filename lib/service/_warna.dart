import 'package:flutter/material.dart';

gradientColor() {
  return (BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Colors.blue[200],
          Colors.white,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.decal),
  ));
}

gradientColorBody() {
  return (BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Colors.orange,
          Colors.white,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(10.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.decal),
  ));
}
