// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:login_app_2025/ui/auth/login_screen.dart';
// import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/admin_dashboard_state.dart';
// import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/employee_dashboard_state.dart';
// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;

//     // If user exists → skip Login
//     if (user != null) {
//       return FutureBuilder(
//         future: FirebaseFirestore.instance.collection('Users').doc(user.uid).get(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Scaffold(body: Center(child: CircularProgressIndicator()));
//           }

//           final role = snapshot.data!['role'];

//           if (role == 'Admin') return AdminDashboardState();
//           if (role == 'Employee') return EmployeeDashboardState();

//           return const Scaffold(body: Center(child: Text("Unknown role")));
//         },
//       );
//     }

//     // If not logged in → open LoginScreen
//     return const LoginScreen();
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/admin_dashboard_state.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/employee_dashboard_state.dart';

// --- Local Imports ---
import 'splash_screen.dart'; // The customized Shaheen Services Splash Screen

// Importing state wrappers from your structure

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. StreamBuilder listens to real-time authentication status changes (login/logout).
    // This is the most reliable way to handle persistent login state.
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        // A. Initial Check: If the connection is waiting, we show the splash screen.
        // This covers the brief moment Firebase determines the initial status.
        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        final user = authSnapshot.data;

        // B. User is Logged In - Now we must Check Role.
        if (user != null) {
          // Use FutureBuilder to asynchronously fetch the role data from Firestore.
          return FutureBuilder<DocumentSnapshot>(
            // Query Firestore using the logged-in user's unique ID (UID)
            future: FirebaseFirestore.instance.collection('Users').doc(user.uid).get(),
            builder: (context, roleSnapshot) {
              // B1. Loading Role Data: Show splash screen while data is retrieved or loading.
              if (roleSnapshot.connectionState == ConnectionState.waiting || !roleSnapshot.hasData) {
                return const SplashScreen();
              }

              // B2. Error State: Handle if Firestore retrieval fails.
              if (roleSnapshot.hasError) {
                return const Scaffold(body: Center(child: Text("Error fetching user data. Please contact support.")));
              }

              // B3. Data Ready: Extract and route based on role.
              // Note: Assumes 'role' field exists and is correctly populated in Firestore.
              final roleData = roleSnapshot.data!.data() as Map<String, dynamic>?;
              final role = roleData?['role'];

              // Route based on role
              if (role == 'Admin') {
                return const AdminDashboardState();
              } else if (role == 'Employee') {
                return const EmployeeDashboardState();
              } else {
                // Default: Unknown role or missing data. Force sign out for security.
                FirebaseAuth.instance.signOut();
                return const Scaffold(body: Center(child: Text("Access Denied: Role not defined. Logging out...")));
              }
            },
          );
        }

        // C. User is Not Logged In - Redirect to the Login Screen
        return const LoginScreen();
      },
    );
  }
}
