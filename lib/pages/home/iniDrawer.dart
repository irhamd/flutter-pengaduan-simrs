import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/globalVar.dart';

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
              backgroundImage: NetworkImage(
                  baseUrlRoute + "/Users/" + Var_data_login["user"]["foto"]),
              // backgroundColor: Colors.brown.shade800,
            ),
          ),
          accountName: Text(Var_data_login["pegawai"]["namapegawai"]),
          accountEmail: Text(Var_data_login["user"]["nohp"]),
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
                  "",
                  style: TextStyle(fontSize: 10),
                ),
                radius: 10,
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, "/rest_get");
          },
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
                  "",
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
        //       Icons.data_usage,
        //       color: Colors.white,
        //       size: 30.0,
        //     ),
        //   ),
        //   onTap: () {},
        //   title: Text("v 1.2"),
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
