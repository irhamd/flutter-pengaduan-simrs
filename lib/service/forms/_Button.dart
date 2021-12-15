import 'package:flutter/material.dart';

Button_(onPressed, title, _icon) {
  return Container(
    height: 40,
    child: (ElevatedButton(
        onPressed: onPressed,
        child: Center(
          child: Align(
            alignment: Alignment
                .center, // Align however you like (i.e .centerRight, centerLeft)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(_icon),
                Text(title),
              ],
            ),
          ),
        ))),
  );
}
