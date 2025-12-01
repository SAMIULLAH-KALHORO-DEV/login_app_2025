import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

class SurveyDetailPage extends StatelessWidget {
  final String surveyId;
  final Map<String, dynamic> data;

  const SurveyDetailPage({super.key, required this.surveyId, required this.data});

  Widget buildField(String title, String? value) {
    final isUrdu = RegExp(r'[\u0600-\u06FF]').hasMatch(value ?? '');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Column(
        crossAxisAlignment: isUrdu ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: PastelDuskTheme.light.textTheme.titleLarge!.copyWith(fontFamily: 'manrope'),
            textAlign: isUrdu ? TextAlign.right : TextAlign.left,
          ),
          const SizedBox(height: 4),
          Text(
            value ?? '',
            textDirection: isUrdu ? TextDirection.rtl : TextDirection.ltr,
            textAlign: isUrdu ? TextAlign.right : TextAlign.left,
          ),
          Divider(color: AppColors.cardBorderColor, thickness: 1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Survey Details')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            buildField('Reporter Name', data['reporterName']),
            buildField('Date', data['date']),
            buildField('Project Site', data['projectSite']),
            buildField('Report Type', data['reportType']),
            buildField('Observation', data['reportObservation']),
            buildField('Possibilities', data['possibilities']),
            buildField('Action Review', data['actionReview']),
          ],
        ),
      ),
    );
  }
}
