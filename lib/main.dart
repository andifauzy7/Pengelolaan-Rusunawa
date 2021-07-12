import 'package:flutter/material.dart';
import 'package:pengelolaan_rusunawa/presentationLayer/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pengelolaan Rusunawa",
      home: LoginScreen(),
    );
  }
}






