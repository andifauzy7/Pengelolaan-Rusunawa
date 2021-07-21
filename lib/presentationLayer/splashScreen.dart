import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/dataLayer/session/sharedPreference.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/loginScreen.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/mainScreen.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var duration = const Duration(seconds: 3);

  Future<bool> isSession() async {
    var result = await SharedPreference.getUsername();
    return (result != null);
  }

  void changePage() async {
    bool isFound = await isSession();
    if (isFound) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  void afterFirstLayout(BuildContext context) {
    new Future.delayed(duration, changePage);
  }

  @override
  void initState() {
    afterFirstLayout(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Image(
            width: MediaQuery.of(context).size.width * 0.5,
            image: AssetImage('assets/logo.png'),
          ),
        ),
        Container(
          child: Center(
            child: Text('Pengelolaan Rusunawa Regional Jawa Barat',
                style: TextStyle(fontSize: 16.0, color: ColorsTheme.mainColor)),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(48.0, 16.0, 48.0, 16.0),
            child: LinearProgressIndicator()),
        Container(
          child: Text("Ver 1.0.0"),
        )
      ],
    ));
  }
}
