import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/employee_dashboard.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/resources/resources.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/shcedule/shcedule.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/tasks/tasks.dart';

class EmployeeDashboardState extends StatefulWidget {
  const EmployeeDashboardState({super.key});

  @override
  State<EmployeeDashboardState> createState() => _EmployeeDashboardStateState();
}

class _EmployeeDashboardStateState extends State<EmployeeDashboardState> {
  int currentIndex = 0;

  final screens = [EmployeeDashboard(), TasksPage(), SchedulePage(), ResourcesPage()];

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
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.group), label: 'Dasboard'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chart_bar_alt_fill), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.doc_checkmark), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Resources'),
        ],
      ),
    );
  }
}
