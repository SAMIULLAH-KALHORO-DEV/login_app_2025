// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/constants/background/background_one.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/resources/resources.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/shcedule/shcedule.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/tasks/tasks.dart';

import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/card_section.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/profile_section.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/role_base_grid.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/widgets/upcoming_events.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

int currentIndex = 0;

final screens = [EmployeeDashboard(), TasksPage(), SchedulePage(), ResourcesPage()];


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
                    SizedBox(height: 10),
                    // Text('Quick Access View', style: TextsTheme().heading1sytle),
                    // PriorityCardRow(),
                    PriorityCardRow(),
                    SizedBox(height: 10),
                    EmployeeRoleBasedGrid(),
                    Text(
                      'UpComing Events',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryText),
                    ),
                    SizedBox(height: 30),
                    UpcomingEventsCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    
    );
  }
}
