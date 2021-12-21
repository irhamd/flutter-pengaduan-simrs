import 'package:applikasi_pelaporan_simrs/pages/home/iniDrawer.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/api/_api.dart';
import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:applikasi_pelaporan_simrs/service/forms/_Button.dart';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var pending = 0;
  var selesai = 0;

  @override
  void initState() {
    EasyLoading.dismiss();

    CollectionReference reference =
        FirebaseFirestore.instance.collection('service');
    reference.snapshots().listen((querySnapshot) {
      Api.Get_("pengaduan-getCountNumber").then((res) {
        setState(() {
          pending = res["rq"] != null ? res["rq"] : 0;
          selesai = res["dn"] != null ? res["dn"] : 0;
        });
        // print(res["id"].toString());
      });
    });
    // TODO: implement initState

    super.initState();
  }

  getData() {
    // Api.Get_("pengaduan-getCountNumber").then((res) {
    //   EasyLoading.showInfo("iniiii");
    //   print(res.toString());
    //   setState(() {
    //     pending = res["rq"];
    //     selesai = res["dn"];
    //   });
    //   // print(res["id"].toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: gradientColor(),
          child: SingleChildScrollView(
            child: Container(
              // padding: EdgeInsets.only(top: 10),
              child: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // StreamBuilder<QuerySnapshot>(
                  //     stream: FirebaseFirestore.instance
                  //         .collection('pengaduan')
                  //         .snapshots(),
                  //     // ignore: missing_return
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         print(snapshot.hasData.toString());
                  //         // getData();
                  //         EasyLoading.showInfo("update dashboard");
                  //         return Text("");
                  //       }
                  //     }),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            scaffoldKey.currentState.openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            color: Colors.blueGrey,
                            size: 40.0,
                          ),
                        ),
                        Text(Var_data_login["pegawai"]["namapegawai"]),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(baseUrlRoute +
                              "/Users/" +
                              Var_data_login["user"]["foto"]),
                          // backgroundColor: Colors.brown.shade800,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 33, right: 20, top: 20),
                    child: Column(
                      children: [
                        Text(
                          "SIMPEL",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 53,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'fontdashboard'
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Sistem Informasi  Pelayanan SIMRS",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14.0,
                                  fontFamily: 'font2',
                                  // fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "ver 1.5",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5.0,
                      children: <Widget>[
                        BigButton("/tugas_pending", "assets/todo.png", "Tugas",
                            pending.toString(), context),
                        BigButton("/tugas_selesai", "assets/note.png",
                            'Riwayat', selesai.toString(), context),
                        BigButton("/rest_post", "assets/calendar.png", "Agenda",
                            '-', context),
                        BigButton("/home", "assets/settings.png", "Setting",
                            '-', context),
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}
