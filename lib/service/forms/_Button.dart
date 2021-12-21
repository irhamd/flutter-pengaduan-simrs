import 'package:flutter/material.dart';

Button_(onPressed, title, _icon) {
  return Container(
    height: 40,
    child: (ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue[400],
            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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

BigButton(String route, asset, title, subtitle, context) {
  return (SizedBox(
    width: 160.0,
    height: 160.0,
    child: Card(
      color: Colors.blue[700],
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                asset,
                width: 54.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                radius: 13.0,
                backgroundColor: Colors.orange,
                // backgroundImage: AssetImage("assets/petugas.jpg"),
                child: Text(
                  subtitle,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                // backgroundColor: Colors.brown.shade800,
              ),
            ],
          ),
        )),
      ),
    ),
  ));
}
