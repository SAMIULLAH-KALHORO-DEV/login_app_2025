// The logic in this file is acceptable, provided the Sign-Out function is fixed.

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
      // Fetch role from Realtime Database using the current user's UID
      DatabaseReference ref = FirebaseDatabase.instance.ref("Users/${user.uid}/role");

      ref
          .get()
          .then((snapshot) {
            String role = snapshot.value.toString();

            // Wait 3 seconds (assuming this is a visual delay for the splash screen)
            Timer(Duration(seconds: 3), () {
              if (role == 'admin') {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
              } else if (role == 'manager') {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmployeeDashboard()));
              } else {
                // Should redirect to login if role is missing/corrupt
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            });
          })
          .catchError((e) {
            // Handle error during role fetch
            Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())),
            );
          });
    } else {
      // No user is logged in, proceed to Login Screen
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())),
      );
    }
  }
}
