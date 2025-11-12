import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/dashboard_screens/widgets/bottom_navigation_bar.dart';
import 'package:login_app_2025/ui/dashboard_screens/widgets/profile_section.dart';
import 'package:login_app_2025/ui/dashboard_screens/widgets/role_base_grid.dart';
import 'package:login_app_2025/ui/dashboard_screens/widgets/upcoming_events.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileSection(),
                SizedBox(height: 30),
                Text('Quick Access Panel', style: TextsTheme().heading1sytle),
                SizedBox(height: 30),
                RoleBasedGrid(),
                Text('Events', style: TextsTheme().heading1sytle),
                SizedBox(height: 30),
                UpcomingEvents(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
