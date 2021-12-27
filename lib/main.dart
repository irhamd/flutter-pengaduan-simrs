import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:notification/pages/Test/ProsesPengaduan.dart';
import 'package:notification/pages/Test/Rest/rest_get.dart';
import 'package:notification/pages/Test/Rest/rest_post.dart';
import 'package:notification/pages/Test/TestUploadImage.dart';
import 'package:notification/pages/Test/camera_alt.dart';
import 'package:notification/pages/Test/halaman_horizontal.dart';
import 'package:notification/pages/Test/test_storage.dart';
import 'package:notification/pages/auth/login.dart';
import 'package:notification/pages/home/dashboard.dart';
import 'package:notification/pages/home/home_drawer.dart';
import 'package:notification/pages/tugas/followup_tugas.dart';
import 'package:notification/pages/tugas/input_tugas.dart';
import 'package:notification/pages/tugas/tugas_pending.dart';
import 'package:notification/pages/tugas/tugas_selesai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Simrs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      builder: EasyLoading.init(),
      routes: {
        '/home': (cx) => HomeDrawer(),
        // '/home1': (cx) => HomeDrawer(),
        // '/home2': (cx) => Home4(),
        '/camera': (cx) => TestCamera(),
        '/hal': (cx) => HalamanHorizontal(),
        '/rest_get': (cx) => RestGet(),
        '/tugas_pending': (cx) => TugasPending(),
        '/tugas_selesai': (cx) => TugasSelesai(),
        '/rest_post': (cx) => RestPost(),
        '/proses_pengaduan': (cx) => ProsesPengaduan(),
        '/test_storage': (cx) => TestStorage(),
        '/login': (cx) => Login(),
        '/test_upload_image': (cx) => TestUploadImage(),
        '/dashboard': (cx) => Dashboard(),
        '/input_tugas': (cx) => InputTugas(),
        '/follow_up': (cx) => FollowUpTugas(),
      },
    );
  }
}
