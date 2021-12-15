import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// ignore: non_constant_identifier_names
IniDrawer(BuildContext context) {
  return (Drawer(
    child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            // child: Icon(
            //   Icons.person,
            //   size: 50.0,
            // ),
            child: CircleAvatar(
              radius: 60.0,
              // backgroundColor: Colors.brown.shade800,
              backgroundImage: AssetImage("assets/petugas.jpg"),
            ),
          ),
          accountName: Text('Aan Ribahan'),
          accountEmail: Text(GetStorage().read('nomorhp')),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Text("Profile Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.speaker_phone,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Row(
            children: [
              Text("Daftar Tugas  "),
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  "7",
                  style: TextStyle(fontSize: 10),
                ),
                radius: 10,
              ),
            ],
          ),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.rotate_90_degrees_ccw,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Row(
            children: [
              Text("Tugas Pending  "),
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 10),
                ),
                radius: 10,
              ),
            ],
          ),
          onTap: () {},
        ),
        // ListTile(
        //   leading: CircleAvatar(
        //     child: Icon(
        //       Icons.cached,
        //       color: Colors.white,
        //       size: 30.0,
        //     ),
        //   ),
        //   onTap: () {
        //     Navigator.pushNamed(context, '/test_storage');
        //   },
        //   title: Text("Storage"),
        // ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Text("Logout"),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    ),
  ));
}
