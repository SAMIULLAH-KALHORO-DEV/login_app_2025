import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/admin_dashboard.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/approval_screen/approval_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/reports_screen/reports_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/settings/settings.dart';

class AdminDashboardState extends StatefulWidget {
  const AdminDashboardState({super.key});

  @override
  State<AdminDashboardState> createState() => _AdminDashboardStateState();
}

class _AdminDashboardStateState extends State<AdminDashboardState> {
  int currentIndex = 0;

  final screens = [AdminDashboard(), ReportsScreen(), ApprovalsScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.cardDefaultBackground,
        selectedItemColor: AppColors.primaryInteraction,
        unselectedItemColor: AppColors.secondaryTextHint,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.group), label: 'Employees'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chart_bar_alt_fill), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.doc_checkmark), label: 'Approvals'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
