import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:notification/pages/home/iniDrawer.dart';
import 'package:notification/service/_input.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/globalVar.dart';

class HomeDrawer extends StatefulWidget {
  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  void initState() {
    EasyLoading.dismiss();
    // TODO: implement initState
    super.initState();
  }

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
        onPressed: () {
          Navigator.pushNamed(context, "/tugas_pending");
        },
        child: Icon(Icons.speaker_phone, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          // EasyLoading.showInfo(value.toString()),
          // if (value == 0) Navigator.pushNamed(context, "tugas_pending"),
          if (value == 1) Navigator.pushNamed(context, "/tugas_selesai")
        },
        items: ButtonNavigasi()
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
                  "9",
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
                padding: const EdgeInsets.all(28.0),
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
                            Navigator.pushNamed(context, "/dashboard");
                          },
                          child: Text("Dashboard")),
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
