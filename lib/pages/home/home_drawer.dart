import 'package:applikasi_pelaporan_simrs/pages/home/iniDrawer.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
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
          ],
        ),
      ),
    );
  }
}
