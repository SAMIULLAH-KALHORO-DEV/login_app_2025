import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/admin_dashboard.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/employee_dashboard.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      DatabaseReference ref = FirebaseDatabase.instance.ref("Users/${user.uid}/role");

      ref
          .get()
          .then((snapshot) {
            String role = snapshot.value.toString();

            Timer(Duration(seconds: 3), () {
              if (role == 'admin') {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
              } else if (role == 'employee') {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmployeeDashboard()));
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            });
          })
          .catchError((e) {
            // fallback if role not found
            Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())),
            );
          });
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())),
      );
    }
  }
}
