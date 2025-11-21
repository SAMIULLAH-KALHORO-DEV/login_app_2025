import 'package:flutter/material.dart';
import 'package:login_app_2025/ui/quick_access_panel/Surveys/survey_forms/survey_form1.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Surveys')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Reports Screen')),
          // Add more survey forms or options here
        ],
      ),
    );
  }
}
