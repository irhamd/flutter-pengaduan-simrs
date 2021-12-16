import 'package:applikasi_pelaporan_simrs/pages/home/iniDrawer.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/api/_api.dart';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
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
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.rotate_90_degrees_ccw,
                color: Color(0xff6bceff),
              ),
              title: Text(
                'Pending',
                style: TextStyle(
                  color: Color(0xff6bceff),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add_check),
              title: Text('Riwayat Tugas'),
            ),
          ],
        ),
        drawer: IniDrawer(context),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.only(top: 10),
          decoration: gradientColor(),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.menu_open,
                      color: Colors.white,
                      size: 52.0,
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/petugas.jpg"),
                      // backgroundColor: Colors.brown.shade800,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33, right: 20, top: 20),
                child: Text(
                  "Selamat Datang, \nApplikasi Pengaduan SIMRS",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20.0,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          EasyLoading.showInfo("status");
                        },
                        child: SizedBox(
                          width: 160.0,
                          height: 160.0,
                          child: Card(
                            color: Colors.blue[900],
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/todo.png",
                                    width: 64.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Pending",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "2 Tugas",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.blue[900],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/note.png",
                                  width: 64.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Riwayat",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "12 Items",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.blue[900],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/calendar.png",
                                  width: 64.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Agenda",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "4 Tugas",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: Colors.blue[900],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/settings.png",
                                  width: 64.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
