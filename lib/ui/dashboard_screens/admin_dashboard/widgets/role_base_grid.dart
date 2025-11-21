import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/submit_survey_lists/submitted_survey_lists.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/survey_form1.dart';

class AdminRoleBasedGrid extends StatefulWidget {
  const AdminRoleBasedGrid({super.key});

  @override
  State<AdminRoleBasedGrid> createState() => _AdminRoleBasedGridState();
}

class _AdminRoleBasedGridState extends State<AdminRoleBasedGrid> {
  final List<Map<String, dynamic>> gridItems = [
    {'icon': CupertinoIcons.bag_badge_plus, 'title': 'Surveys'},
    {'icon': Icons.miscellaneous_services, 'title': 'Services'},
    {'icon': Icons.description, 'title': 'Latters'},
    {'icon': Icons.query_stats_outlined, 'title': 'Analytics'},
    {'icon': Icons.notifications, 'title': 'Notifications'},
    {'icon': Icons.person, 'title': 'Profile'},
  ];
  void _onItemTap(String title) {
    switch (title) {
      case 'Surveys':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
      case 'Services':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
      case 'Latters':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
      case 'Analytics':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
      case 'Notifications':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
      case 'Profile':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SurveyForm1()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;

          // Auto adjust based on screen width
          if (constraints.maxWidth >= 1200) {
            crossAxisCount = 6; // Large Desktop
          } else if (constraints.maxWidth >= 900) {
            crossAxisCount = 5; // Medium Web / Tablet Landscape
          } else if (constraints.maxWidth >= 600) {
            crossAxisCount = 4; // Small Web / Tablet
          } else {
            crossAxisCount = 3; // Mobile
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            itemCount: gridItems.length,
            itemBuilder: (context, index) {
              final item = gridItems[index];

              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => _onItemTap(item['title']),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(16),
                      decoration: ContainerTheme().containerTheme1,
                      child: Icon(item['icon'], size: 40, color: ColorsTheme().iconColor),
                    ),
                    SizedBox(height: 8),
                    Text(item['title'], style: TextsTheme().heading3sytle, textAlign: TextAlign.center),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
