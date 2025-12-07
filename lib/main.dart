import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // <-- Import Riverpod
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/firebaseServices/auth_wrapper.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/admin_dashboard_state.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/employee_dashboard_state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const ProviderScope(
      // <-- Wrap your app in ProviderScope
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthWrapper(),
      initialRoute: '/',
      routes: {
        // '/': (context) => const LoginScreen(),
        '/adminHome': (context) => const AdminDashboardState(),
        '/employeeHome': (context) => const EmployeeDashboardState(),
      },
      theme: PastelDuskTheme.light,

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
