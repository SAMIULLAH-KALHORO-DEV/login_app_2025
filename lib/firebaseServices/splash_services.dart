import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app_2025/contect_permission.dart';

import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/ui/post_screen/post_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
        Duration(seconds: 3),
        () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsScreen())),
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsScreen())),
      );
    }
  }
}
