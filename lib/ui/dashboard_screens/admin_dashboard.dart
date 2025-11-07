import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/text_theme.dart';
import 'package:login_app_2025/ui/dashboard_screens/widgets/bottom_navigation_bar.dart';
import 'package:login_app_2025/ui/dashboard_screens/widgets/profile_section.dart';
import 'package:login_app_2025/ui/dashboard_screens/widgets/role_base_grid.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [ProfileSection(), SizedBox(height: 30), RoleBasedGrid()]),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
