import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
IniDrawer(BuildContext context) {
  return (Drawer(
    child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 50.0,
            ),
          ),
          accountName: Text('Atharudin'),
          accountEmail: Text('+62854229900'),
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
              Icons.settings,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Text("Settings"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.help_outline,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Text("About us"),
          onTap: () {},
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.cached,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/test_storage');
          },
          title: Text("Storage"),
        ),
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
