import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:notification/pages/home/iniDrawer.dart';
import 'package:notification/service/_input.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/_api.dart';
import 'package:notification/service/api/api_post.dart';
import 'package:notification/service/forms/_Button.dart';
import 'package:notification/service/globalVar.dart';

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
    getData();
    EasyLoading.dismiss();
    Var_id_pegawai = Var_data_login['user']["id_pegawai"].toString();
    // TODO: implement initState

    super.initState();
  }

  void getData() {
    Api.Get_("pengaduan-getCountNumber").then((res) {
      print(res.toString());
      setState(() {
        pending = res["rq"];
        selesai = res["dn"];
      });
      // print(res["id"].toString());
    });
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
           items: ButtonNavigasi()
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
                              Var_data_login["pegawai"]["foto"]),
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
                                Var_ver,
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
                            "", context),
                        // BigButton("/tugas_selesai", "assets/note.png",
                        BigButton(
                            Var_data_login['user']['role'] == 'kains'
                                ? "/data_petugas"
                                : "/tugas_selesai",
                            "assets/note.png",
                            'Riwayat',
                            "",
                            context),
                        BigButton("/input_tugas", "assets/calendar.png",
                            "Input", '', context),
                        BigButton("/home", "assets/settings.png", "Setting", '',
                            context),
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
