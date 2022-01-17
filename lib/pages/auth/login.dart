import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:notification/pushNotification.dart';
import 'package:notification/service/_input.dart';
import 'package:notification/service/_messageDialog.dart';
import 'package:notification/service/_warna.dart';
import 'package:notification/service/api/api_post.dart';
import 'package:notification/service/globalVar.dart';

class Login extends StatefulWidget {
  const Login({key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final box = GetStorage();
  FirebaseNotifcation firebase;

  String token = "";

  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController ctr = TextEditingController();

  handleAsync() async {
    await firebase.initialize();
    token = await firebase.getToken();

    setState(() {
      ctr.text = token;
    });
    print("Firebase token : $token");
  }

  String phoneNumber, _phoneNumber = "";
  String nomorhp = GetStorage().read('nomorhp') != null
      ? GetStorage().read('nomorhp')
      : "no phone";

  @override
  void initState() {
    Var_tokenx = "";

    firebase = FirebaseNotifcation();
    handleAsync();
    super.initState();
  }

  void _attemptLogin() {
    EasyLoading.show(status: "Loading");
    // Navigator.pushNamed(context, '/input');
    try {
      Object obj = {
        "name": user.text.toString(),
        "password": pass.text.toString(),
        "token_firebase": token.toString()
      };

      Api.post("loginRev", obj).then((val) {
        // print(val.toString());
        if (val["user"] != null) {
          Var_data_login = val;
          Var_tokenx = val["token"].toString();
          box.write('token', val.toString());
          print("ini token nya" + Var_tokenx.toString());
          // Navigator.pushReplacementNamed(context, '/home');
          Navigator.pushReplacementNamed(context, '/dashboard');
          // ShowMessage("Mohon Tunggu, keluhan anda sedang di proses ...", context);
        } else {
          ShowToastr("User tidak ditemukan");
          // EasyLoading.showError(" ");
          EasyLoading.dismiss();
        }
      });
    } catch (e) {
      EasyLoading.dismiss();
      ShowToastr("User tidak ditemukan");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Login"),
        // ),
        body: Container(
      height: 3000,
      decoration: gradientColor(),
      child: ListView(
        children: <Widget>[
          ///custom itemBuilder and dropDownBuilder
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
                          'SISTEM PELAYANAN SIMRS',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
                Spacer(),
                Text(
                  " SILAHKAN UPDATE DI SINI ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
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
                Text("@2021 $Var_ver simrs-rsudkotamataram"),
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
