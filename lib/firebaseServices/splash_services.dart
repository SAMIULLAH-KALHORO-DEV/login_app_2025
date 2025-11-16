// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// / splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_app_2025/constants/app_assets.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/admin_dashboard.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/employee_dashboard.dart';

// Firebase Auth instance provider
final authProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// Auth state stream provider
final currentUserProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

// Fetch role from Firestore: Users → uid → role
final roleProvider = FutureProvider.family<String?, String>((ref, uid) async {
  final doc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();
  if (!doc.exists) return null;
  return doc.data()?['role']?.toString();
});

// splash_screen.dartove

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);

    return userAsync.when(
      data: (user) {
        if (user == null) {
          // User not logged in → go to Login
          return _redirect(context, LoginScreen());
        }

        // User is logged in → check role from Firestore
        final roleAsync = ref.watch(roleProvider(user.uid));

        return roleAsync.when(
          data: (role) {
            if (role == 'admin') {
              return _redirect(context, AdminDashboard());
            } else if (role == 'manager') {
              return _redirect(context, EmployeeDashboard());
            } else {
              return _redirect(context, LoginScreen());
            }
          },
          loading: () => _loading(),
          error: (_, __) => _redirect(context, LoginScreen()),
        );
      },
      loading: () => _loading(),
      error: (_, __) => _redirect(context, LoginScreen()),
    );
  }

  Widget _loading() {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _redirect(BuildContext context, Widget page) {
    Future.microtask(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
    });

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
