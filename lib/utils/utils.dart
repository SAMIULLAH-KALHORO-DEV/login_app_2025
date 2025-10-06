import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(msg: message, 
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    backgroundColor: const Color.fromARGB(101, 244, 67, 54),
    textColor: Colors.white,
    gravity: ToastGravity.CENTER);
  }
}
