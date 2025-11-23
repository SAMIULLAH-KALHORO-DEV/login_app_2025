import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/profile_section.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/role_base_grid.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/upcoming_events.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  // int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // this is change
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
                AdminRoleBasedGrid(),
                Text('Events', style: TextsTheme().heading1sytle),
                SizedBox(height: 30),
                UpcomingEvents(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(
      //   currentIndex: _selectedIndex,
      //   onItemTapped: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });

      //     switch (index) {
      //       case 1:
      //       case 2:
      //       case 3:
      //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SubmittedSurveyList()));
      //         break;
      //     }
      //   },
      // ),
    );
  }
}
