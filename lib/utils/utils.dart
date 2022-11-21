import 'package:flutter/material.dart';

class Utils {

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String? errMsg) {
    if (errMsg == null) return;

    final snackBar = SnackBar(content: Text(errMsg), backgroundColor: Colors.redAccent);

    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);

  }

}

TextStyle textStyle = TextStyle(
  fontSize: 16,
  color: Colors.white
);