import 'package:applikasi_pelaporan_simrs/pages/Test/Rest/rest_get.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/Rest/rest_post.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/TestFirestore.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/camera_alt.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/halaman_horizontal.dart';
import 'package:applikasi_pelaporan_simrs/pages/home.dart';
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
      home: Home(title: 'APPLIKASI PENGADUAN SIMRS'),
      routes: {
        '/camera': (cx) => const TestCamera(),
        '/hal': (cx) => const HalamanHorizontal(),
        '/rest_get': (cx) => const RestGet(),
        '/rest_post': (cx) => const RestPost(),
        '/test_firestore': (cx) => const TestFirestore(),
      },
    );
  }
}
