import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/dataLayer/session/sharedPreference.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/ubahProfilScreen.dart';
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UbahProfilScreen()));
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
                    _showMaterialDialog(context);
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

  _showMaterialDialog(BuildContext context) {

    Future<void> logout() async {
      await SharedPreference.deleteSharedPref();
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen()));
    }

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Keluar"),
          content: Text("Anda yakin keluar dari aplikasi?"),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorsTheme.mainColor, // background
                onPrimary: Colors.white, // foreground
              ),
              child: Text(
                'Ya',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                logout();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey, // background
                onPrimary: Colors.white, // foreground
              ),
              child: Text(
                'Tidak',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
