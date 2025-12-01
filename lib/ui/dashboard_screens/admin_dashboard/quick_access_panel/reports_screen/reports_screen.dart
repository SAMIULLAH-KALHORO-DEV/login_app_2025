import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/Surveys/survey_forms/submit_survey_lists/submitted_survey_lists.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard/quick_access_panel/Surveys/surveys_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/services/fumigation_serivces/fumigation_services_monthly_list.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/screens/surveys.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports Screen')),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fumigation Services',
                    style: PastelDuskTheme.light.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text('monthly reports of fumigation services are here'),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        /* Navigate to Compliance Check List */
                        Navigator.push(context, MaterialPageRoute(builder: (_) => FumigationServicesMonthlyList()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.dataViz3,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Check List'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Site Visit Reports',
                    style: PastelDuskTheme.light.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text('Check records '),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        /* Navigate to Compliance Check List */
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SubmittedSurveyList()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.dataViz4,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Check Records'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
