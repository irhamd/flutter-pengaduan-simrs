import 'package:applikasi_pelaporan_simrs/pages/home/iniDrawer.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: IniDrawer(context),
      appBar: AppBar(
        title: Text("SISTEM PENGADUAN SIMRS"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6bceff),
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xff6bceff),
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Color(0xff6bceff),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Historique'),
          ),
        ],
      ),
      body: Container(
        decoration: gradientColor(),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: ListTile(
                leading: Icon(Icons.event_available),
                title: Text("Acheter un Cadeau"),
                trailing: Text(
                  "-200",
                  style: TextStyle(color: Colors.red),
                ),
                subtitle:
                    Text("Acheter un Cadeau pour l'anniversaire de mon amis"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event_available),
              title: Text("La bourse"),
              trailing: Text(
                "+400",
                style: TextStyle(color: Colors.green),
              ),
              subtitle: Text("La bourse de December..."),
            ),
            Container(
              decoration: gradientColor(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Inputan("inputann11", null),
                      // Inputan("inputann11", null),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/rest_get");
                          },
                          child: Text("Rest Get")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/rest_post");
                          },
                          child: Text("Rest Post")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/test_firestore");
                          },
                          child: Text("Test firestore")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          child: Text("Login")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/camera");
                          },
                          child: Text("Camera")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/home1");
                          },
                          child: Text("Home 1")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/proses_pengaduan");
                          },
                          child: Text(VarTitle.toString())),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/test_upload_image");
                          },
                          child: Text("Test Upload Image")),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
