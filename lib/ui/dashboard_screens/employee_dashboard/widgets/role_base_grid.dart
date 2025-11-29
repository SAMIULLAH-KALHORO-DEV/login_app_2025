import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/submit_survey_lists/submitted_survey_lists.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/survey_form1.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/services/fumigation_serivces/fumigation_services_monthly_list.dart';

class EmployeeRoleBasedGrid extends StatefulWidget {
  const EmployeeRoleBasedGrid({super.key});

  @override
  State<EmployeeRoleBasedGrid> createState() => _EmployeeRoleBasedGridState();
}

class _EmployeeRoleBasedGridState extends State<EmployeeRoleBasedGrid> {
  final List<Map<String, dynamic>> gridItems = [
    {'icon': CupertinoIcons.chart_bar_square, 'title': 'Surveys'}, // survey/chart
    {'icon': CupertinoIcons.square_list, 'title': 'Services'}, // services/list
    {'icon': CupertinoIcons.clock, 'title': 'Schedule'}, // schedule/time
    {'icon': CupertinoIcons.chart_pie, 'title': 'Analytics'}, // analytics
    {'icon': CupertinoIcons.bell, 'title': 'Notifications'}, // notifications
    {'icon': CupertinoIcons.person, 'title': 'Profile'}, // profile
  ];

  void _onItemTap(String title) {
    switch (title) {
      case 'Surveys':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SurveyForm1()));
        break;
      case 'Services':
        Navigator.push(context, MaterialPageRoute(builder: (_) => FumigationServicesMonthlyList()));
        break;
      case 'Schedule':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
      case 'Analytics':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
      case 'Notifications':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
      case 'Profile':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 icons per row
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: .7, // Adjust height for icon + title
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
                Card(
                  color: AppColors.cardDefaultBackground,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  shadowColor: AppColors.baseAccentShadows,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(item['icon'], size: 40, color: AppColors.dataViz3),

                        SizedBox(height: 8),
                        Text(item['title'], style: TextsTheme().heading3sytle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


  //  Container(
  //               padding: EdgeInsets.all(16),
  //               decoration: ContainerTheme().containerTheme1,
  //               child: Icon(item['icon'], size: 40, color: ColorsTheme().iconColor),
  //             ),
  //             SizedBox(height: 8),
  //             Text(item['title'], style: TextsTheme().heading3sytle),
  //           ],
  //         );