import 'package:applikasi_pelaporan_simrs/pages/Test/ProsesPengaduan.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/Rest/rest_get.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/Rest/rest_post.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/TestFirestore.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/TestUploadImage.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/camera_alt.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/halaman_horizontal.dart';
import 'package:applikasi_pelaporan_simrs/pages/Test/test_storage.dart';
import 'package:applikasi_pelaporan_simrs/pages/auth/login.dart';
import 'package:applikasi_pelaporan_simrs/pages/home/dashboard.dart';
import 'package:applikasi_pelaporan_simrs/pages/home/home_drawer.dart';
import 'package:applikasi_pelaporan_simrs/pages/tugas/tugas_pending.dart';
import 'package:applikasi_pelaporan_simrs/pages/tugas/tugas_selesai.dart';
import 'package:applikasi_pelaporan_simrs/service/notification/pushNotification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  FirebaseNotifcation firebase;

  handleAsync() async {
    await firebase.initialize();

    String token = await firebase.getToken();
    print("Firebase token : $token");
  }

  @override
  void initState() {
    // handleAsync();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext cx) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
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
        '/test_firestore': (cx) => TestFirestore(),
        '/proses_pengaduan': (cx) => ProsesPengaduan(),
        '/test_storage': (cx) => TestStorage(),
        '/login': (cx) => Login(),
        '/test_upload_image': (cx) => TestUploadImage(),
        '/dashboard': (cx) => Dashboard(),
      },
    );
  }
}
