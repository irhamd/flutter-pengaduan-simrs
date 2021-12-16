import 'dart:convert';

import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/api/api_post.dart';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_number/mobile_number.dart';

class Login extends StatefulWidget {
  const Login({key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final box = GetStorage();

  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  String phoneNumber, _phoneNumber = "";
  String nomorhp = GetStorage().read('nomorhp') != null
      ? GetStorage().read('nomorhp')
      : "no phone";

  @override
  void initState() {
    // EasyLoading.showInfo(GetStorage().read('token'));
    // Navigator.pushReplacementNamed(context, '/home');
    EasyLoading.showInfo(GetStorage().read('token'));
    // var ww = jsonDecode(GetStorage().read('token').toString());

    // EasyLoading.showInfo(ww["user"].toString());
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      }
    });
    initMobileNumberState();

    super.initState();
  }

  void _attemptLogin() {
    EasyLoading.show(status: "Loading");
    Object obj = {
      "name": user.text.toString(),
      "password": pass.text.toString()
    };

    Api.post("loginRev", obj).then((val) {
      // print(val.toString());
      if (val["user"] != null) {
        Var_data_login = val;
        Var_tokenx = val["token"].toString();
        box.write('token', val.toString());
        Navigator.pushReplacementNamed(context, '/home');
        // ShowMessage("Mohon Tunggu, keluhan anda sedang di proses ...", context);
      } else {
        ShowToastr("usersalahh");
      }
    });
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = (await MobileNumber.mobileNumber);
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    box.write('nomorhp', mobileNumber);
    setState(() {
      Var_phoneNumber = mobileNumber;
      _phoneNumber = mobileNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Login"),
        // ),
        body: Container(
      decoration: gradientColor(),
      child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff6bceff), Color(0xff6bceff)],
                ),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(90))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Image.asset(
                  "assets/logo.png",
                  width: 120,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32, right: 32),
                    child: Column(
                      children: [
                        Text(
                          'SISTEM PENGADUAN SIMRS',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          _phoneNumber,
                          style: TextStyle(color: Colors.black38, fontSize: 18),
                        ),
                        Text("RSUD Kota Mataram"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 62),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 45,
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5)
                      ]),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.person,
                        color: Color(0xff6bceff),
                      ),
                      hintText: 'Username',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 45,
                  margin: EdgeInsets.only(top: 10),
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5)
                      ]),
                  child: TextField(
                    obscureText: true,
                    controller: pass,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color(0xff6bceff),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, right: 32),
                    child: Text(
                      'Lupa password ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                br(20),
                InkWell(
                  onTap: () {
                    _attemptLogin();
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff6bceff),
                            Color(0xFF00abff),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: Text(
                        'Login'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("@2021 simrs-rsudkotamataram"),
                Text(
                  "#fhd",
                  style: TextStyle(color: Color(0xff6bceff)),
                ),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    ));
    // ignore: dead_code
  }
}
