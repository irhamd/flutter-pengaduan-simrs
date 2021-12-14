import 'package:applikasi_pelaporan_simrs/pages/Test/ProsesPengaduan.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/Rest/rest_get.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/Rest/rest_post.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/TestFirestore.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/camera_alt.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/halaman_horizontal.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/home1.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/test_storage.dart';
import 'package:applikasi_pelaporan_simrs/pages/auth/login.dart';
import 'package:applikasi_pelaporan_simrs/pages/home.dart';
import 'package:applikasi_pelaporan_simrs/pages/home/home_drawer.dart';
import 'package:applikasi_pelaporan_simrs/pages/home2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext cx) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: {
        '/home': (cx) => HomeDrawer(),
        // '/home1': (cx) => HomeDrawer(),
        // '/home2': (cx) => Home4(),
        '/camera': (cx) => TestCamera(),
        '/hal': (cx) => HalamanHorizontal(),
        '/rest_get': (cx) => RestGet(),
        '/rest_post': (cx) => RestPost(),
        '/test_firestore': (cx) => TestFirestore(),
        '/proses_pengaduan': (cx) => ProsesPengaduan(),
        '/test_storage': (cx) => TestStorage(),
        '/login': (cx) => Login(),
      },
    );
  }
}
