import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/constants/background/background_one.dart';

import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/upcoming_events.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/card_section.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/profile_section.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/role_base_grid.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const GeometricBlockBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSectionEmpolyee(),
                    SizedBox(height: 30),
                    // Text('Quick Access View', style: TextsTheme().heading1sytle),
                    // PriorityCardRow(),
                    PriorityCardRow(),
                    SizedBox(height: 30),
                    EmployeeRoleBasedGrid(),
                    Text('UpComing Events', style: TextsTheme().heading1sytle),
                    SizedBox(height: 30),
                    UpcomingEvents(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavBarEmployee(
      //   currentIndex: _selectedIndex,
      //   onItemTapped: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //     switch (index) {
      //       case 0:
      //         Navigator.push(context, MaterialPageRoute(builder: (_) => const EmployeeDashboard()));
      //         break;
      //       case 1:
      //         Navigator.push(context, MaterialPageRoute(builder: (_) => const SubmittedSurveyList()));
      //         break;
      //       case 2:
      //         Navigator.push(context, MaterialPageRoute(builder: (_) => const SubmittedSurveyList()));
      //         break;
      //       case 3:
      //         Navigator.push(context, MaterialPageRoute(builder: (_) => const SubmittedSurveyList()));
      //         break;
      //     }
      //   },
      // ),

      // This implements '3. Bottom Navigation Bar'
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.surfaceBackground,
        selectedItemColor: AppColors.primaryInteraction, // Shaheen Red
        unselectedItemColor: AppColors.secondaryTextHint,
        currentIndex: 0, // Dashboard is active
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          /* Navigation logic goes here */
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Resources'),
        ],
      ),
    );
  }
}
