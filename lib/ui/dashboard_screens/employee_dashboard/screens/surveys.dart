import 'package:flutter/material.dart';
import 'package:login_app_2025/ui/quick_access_panel/Surveys/survey_forms/survey_form1.dart';

class SurveysScreen extends StatelessWidget {
  const SurveysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Surveys')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(''),)
          // Add more survey forms or options here
        ],
      ),
    );
  }
}
