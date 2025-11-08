import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/Theme.dart';
import 'package:login_app_2025/constants/app_assets.dart';
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
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ContainerTheme2(
                        image: DecorationImage(image: AssetImage(AppAssets.upComingEvent), fit: BoxFit.cover),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('10June ', style: TextsTheme().heading1sytle),
                            Text(
                              '10 is the company 20th aniversiry which is very important to all company members',
                              style: TextsTheme().heading2sytle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
