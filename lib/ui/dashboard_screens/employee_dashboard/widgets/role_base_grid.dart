import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/quick_access_panel/Surveys/survey_forms/submit_survey_lists/submitted_survey_lists.dart';
import 'package:login_app_2025/ui/quick_access_panel/Surveys/survey_forms/survey_form1.dart';

class EmployeeRoleBasedGrid extends StatefulWidget {
  const EmployeeRoleBasedGrid({super.key});

  @override
  State<EmployeeRoleBasedGrid> createState() => _EmployeeRoleBasedGridState();
}

class _EmployeeRoleBasedGridState extends State<EmployeeRoleBasedGrid> {
  final List<Map<String, dynamic>> gridItems = [
    {'icon': CupertinoIcons.bag_badge_plus, 'title': 'Surveys'},
    {'icon': Icons.stacked_bar_chart, 'title': 'Reports'},
    {'icon': CupertinoIcons.time, 'title': 'Schedule'},
    {'icon': Icons.analytics, 'title': 'Analytics'},
    {'icon': Icons.notifications, 'title': 'Notifications'},
    {'icon': Icons.person, 'title': 'Profile'},
  ];
  void _onItemTap(String title) {
    switch (title) {
      case 'Surveys':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SurveyForm1()));
        break;
      case 'Reports':
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
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
          crossAxisCount: 3, // 3 icons per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9, // Adjust height for icon + title
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
                  padding: EdgeInsets.all(16),
                  decoration: ContainerTheme().containerTheme1,
                  child: Icon(item['icon'], size: 40, color: ColorsTheme().iconColor),
                ),
                SizedBox(height: 8),
                Text(item['title'], style: TextsTheme().heading3sytle),
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