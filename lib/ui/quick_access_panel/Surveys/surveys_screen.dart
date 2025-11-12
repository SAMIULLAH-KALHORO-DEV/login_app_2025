import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Surveys', style: TextsTheme().heading1sytle)),
    );
  }
}
