import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/admin_dashboard_state.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/employee_dashboard_state.dart';
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // If user exists → skip Login
    if (user != null) {
      return FutureBuilder(
        future: FirebaseFirestore.instance.collection('Users').doc(user.uid).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final role = snapshot.data!['role'];

          if (role == 'Admin') return AdminDashboardState();
          if (role == 'Employee') return EmployeeDashboardState();

          return const Scaffold(body: Center(child: Text("Unknown role")));
        },
      );
    }

    // If not logged in → open LoginScreen
    return const LoginScreen();
  }
}
