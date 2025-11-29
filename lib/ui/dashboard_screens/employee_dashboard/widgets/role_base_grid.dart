import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/Surveys/survey_forms/submit_survey_lists/submitted_survey_lists.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/assigned_jobs/assigned_jobs.dart';
// Note: Assuming these imports resolve the necessary colors, themes, and navigation targets
// These imports suggest this file is part of a larger project structure.
// import 'package:login_app_2025/constants/app_colors.dart';
// import 'package:login_app_2025/constants/app_theme.dart';
// import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/submit_survey_lists/submitted_survey_lists.dart';
// import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/survey_form1.dart';
// import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/services/fumigation_serivces/fumigation_services_monthly_list.dart';

// --- Placeholder/Shim for missing project classes ---
// Since I don't have access to your actual imports (like AppColors, TextsTheme, and the destination pages),
// I will define minimal shims to ensure the code is runnable within an isolated context.
// In your real project, you should remove these shim definitions.

// Shims for Navigation
class SurveyForm1 extends StatelessWidget {
  const SurveyForm1({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CupertinoNavigationBar(middle: Text('Survey Form')),
    body: Center(child: Text('Survey Form 1 Content')),
  );
}

class FumigationServicesMonthlyList extends StatelessWidget {
  const FumigationServicesMonthlyList({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CupertinoNavigationBar(middle: Text('Fumigation Services List')),
    body: Center(child: Text('Services List Content')),
  );
}

// Shims for Style Constants

class TextsTheme {
  // A minimal placeholder for your custom Text style
  TextStyle heading3sytle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF333333));
}
// --- End Shims ---

class EmployeeRoleBasedGrid extends StatefulWidget {
  const EmployeeRoleBasedGrid({super.key});

  @override
  State<EmployeeRoleBasedGrid> createState() => _EmployeeRoleBasedGridState();
}

class _EmployeeRoleBasedGridState extends State<EmployeeRoleBasedGrid> {
  final List<Map<String, dynamic>> gridItems = [
    {
      'icon': CupertinoIcons.calendar_today,
      'title': 'Assigned Jobs',
      'subtitle': '4 Jobs Remaining',
      'color': AppColors.dataViz1, // Corporate Blue
    },
    {
      'icon': CupertinoIcons.cube_box,
      'title': 'Inventory Requests',
      'subtitle': '1 Waiting Approval',
      'color': AppColors.dataViz3, // Amber Orange (Warning)
    },
    {
      'icon': CupertinoIcons.bell,
      'title': 'Announcements',
      'subtitle': 'New Safety Protocol',
      'color': AppColors.secondaryTextHint, // Gray
    },
    {
      'icon': CupertinoIcons.shield_lefthalf_fill,
      'title': 'Compliance & Safety',
      'subtitle': 'Review PPE Checklist',
      'color': AppColors.dataViz4, // Service Green
    },
    {
      'icon': CupertinoIcons.chart_bar_alt_fill,
      'title': 'My Performance',
      'subtitle': '98% On-Time',
      'color': AppColors.dataViz1,
    },
    {
      'icon': CupertinoIcons.time_solid,
      'title': 'Timesheet',
      'subtitle': 'Ready for Submission',
      'color': AppColors.primaryInteraction, // Shaheen Red
    },
  ];

  void _onItemTap(String title) {
    // Corrected navigation logic using the titles defined in gridItems
    Widget? destinationPage;

    switch (title) {
      case 'Assigned Jobs':
        // Mapped to a Schedule/Submitted List placeholder
        destinationPage = AssignedJobs();
        break;
      case 'Inventory Requests':
        // Mapped to a Services list placeholder
        destinationPage = FumigationServicesMonthlyList();
        break;
      case 'Announcements':
        // Mapped to a Notifications/Submitted List placeholder
        destinationPage = SubmittedSurveyList();
        break;
      case 'Compliance & Safety':
        // Mapped to a Survey Form placeholder
        destinationPage = SurveyForm1();
        break;
      case 'My Performance':
        // Mapped to an Analytics/Submitted List placeholder
        destinationPage = SubmittedSurveyList();
        break;
      case 'Timesheet':
        // Mapped to a Submitted Survey List placeholder
        destinationPage = SubmittedSurveyList();
        break;
    }

    if (destinationPage != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => destinationPage!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Use const
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Use const
          crossAxisCount: 3, // 4 icons per row
          mainAxisSpacing: 5,
          crossAxisSpacing: 10,
          childAspectRatio: .8, // Adjust height for icon + title
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
                        // The color used here is AppColors.dataViz3, which seems appropriate for highlighting the icon.
                        Icon(item['icon'] as IconData, size: 40, color: AppColors.dataViz3),

                        const SizedBox(height: 8), // Use const
                        Text(
                          textAlign: TextAlign.center,
                          item['title'] as String,
                          style: PastelDuskTheme.light.textTheme.bodyMedium,
                        ),
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
