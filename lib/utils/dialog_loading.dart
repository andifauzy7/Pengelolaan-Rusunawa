import 'package:flutter/material.dart';

class DialogLoading {
  static showLoading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              title: Center(child: Text("Loading")),
              content: LinearProgressIndicator(),
            ));
  }

  static hideLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
