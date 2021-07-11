import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/utils/colorsTheme.dart';

import 'loginScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.mainColor,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Image(
                  height: MediaQuery.of(context).size.width / 4,
                  image: AssetImage('assets/avatar.png'),
                ),
              ),
              Card(
                margin: EdgeInsets.only(left: 16.0, right: 16.0),
                child: InkWell(
                  onTap: () {
                  },
                  child: ListTile(
                    leading: Icon(Icons.file_copy),
                    title: Text(
                      'Ubah Profil',
                    ),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Keluar',
                    ),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
