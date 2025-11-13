import 'package:flutter/material.dart';

class SurveyDetailPage extends StatelessWidget {
  final String surveyId;
  final Map<String, dynamic> data;

  const SurveyDetailPage({super.key, required this.surveyId, required this.data});

  Widget buildField(String title, String? value) {
    final isUrdu = RegExp(r'[\u0600-\u06FF]').hasMatch(value ?? '');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: isUrdu ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: isUrdu ? TextAlign.right : TextAlign.left,
          ),
          const SizedBox(height: 4),
          Text(
            value ?? '',
            textDirection: isUrdu ? TextDirection.rtl : TextDirection.ltr,
            textAlign: isUrdu ? TextAlign.right : TextAlign.left,
          ),
          const Divider(),
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
