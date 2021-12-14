import 'package:applikasi_pelaporan_simrs/service/_input.dart';
import 'package:applikasi_pelaporan_simrs/service/_messageDialog.dart';
import 'package:applikasi_pelaporan_simrs/service/_warna.dart';
import 'package:applikasi_pelaporan_simrs/service/globalVar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  void _incrementCounter() {
    setState(() {
      VarTitle = "Lemari arsip belum ada";
    });

    Navigator.pushNamed(context, '/hal');
  }

  @override
  // ignore: must_call_super
  void initState() {
    // TODO: implement initState
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
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
      _simCard = (await MobileNumber.getSimCards);
      print(mobileNumber);
      Var_phoneNumber = mobileNumber;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: gradientColor(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Inputan("inputann11", null),
            // Inputan("inputann11", null),
            fillCards(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/rest_get");
                },
                child: Text("Rest Get")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/rest_post");
                },
                child: Text("Rest Post")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/test_firestore");
                },
                child: Text("Test firestore")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/camera");
                },
                child: Text("Camera")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home1");
                },
                child: Text("Home 1")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/proses_pengaduan");
                },
                child: Text(VarTitle.toString())),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
