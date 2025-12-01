import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/approval_screen/approval_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/complinace_alart_card/complinace_alart_card.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/grid_view/grid_view.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/reports_screen/reports_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/settings/settings.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/profile_section.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/widgets/upcoming_events.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int currentIndex = 0;

  final screens = [AdminDashboard(), ReportsScreen(), ApprovalsScreen(), SettingsScreen()];

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
                ProfileSectionAdmin(),
                // SizedBox(height: 30),
                // Text('Quick Access Panel', style: TextsTheme().heading1sytle),
                ComplianceAlertsCard(),
                SizedBox(height: 20),
                ManagementQuickLinksGrid(),
                SizedBox(height: 20),
                // AdminRoleBasedGrid(),
                Text('Events', style: TextsTheme().heading1sytle),
                SizedBox(height: 20),
                UpcomingEventsCardAdmin(),
              ],
            ),
          ),
        ),
      ),
    
    );
  }
}
