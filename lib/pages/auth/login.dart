import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                          'SISTEM PENGADUAN ONLINE',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          'SIMRS',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text('Rsud Kota Mataram'),
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
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                br(20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
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
                Text("Dnon't have an account ?"),
                Text(
                  "Sign Up",
                  style: TextStyle(color: Color(0xff6bceff)),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ],
      ),
    ));
    // ignore: dead_code
  }
}
