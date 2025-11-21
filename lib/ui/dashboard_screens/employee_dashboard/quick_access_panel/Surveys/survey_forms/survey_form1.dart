import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_assets.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/constants/survey_forms_texts/survey_form1_texts.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/widgets/custom_text_field_widget.dart';
import 'package:login_app_2025/widgets/round_botton.dart';

class SurveyForm1 extends StatefulWidget {
  const SurveyForm1({super.key});

  @override
  State<SurveyForm1> createState() => _SurveyForm1State();
}

final TextEditingController reporterNameController = TextEditingController();
final TextEditingController dateController = TextEditingController();
final TextEditingController projectSiteController = TextEditingController();
final TextEditingController reportTypeController = TextEditingController();
final TextEditingController reportObservationController = TextEditingController();
final TextEditingController possibilitiesController = TextEditingController();
final TextEditingController actionReviewController = TextEditingController();

class _SurveyForm1State extends State<SurveyForm1> {
  final CollectionReference surveyCollection = FirebaseFirestore.instance.collection('SurveyForms');

  // future
  void _submitSurvey() async {
    try {
      await surveyCollection.add({
        'reporterName': reporterNameController.text.trim(),
        'date': dateController.text.trim(),
        'projectSite': projectSiteController.text.trim(),
        'reportType': reportTypeController.text.trim(),
        'reportObservation': reportObservationController.text.trim(),
        'possibilities': possibilitiesController.text.trim(),
        'actionReview': actionReviewController.text.trim(),
        'timestamp': DateTime.now().toIso8601String(),
      });

      // clear all fields
      reporterNameController.clear();
      dateController.clear();
      projectSiteController.clear();
      reportTypeController.clear();
      reportObservationController.clear();
      possibilitiesController.clear();
      actionReviewController.clear();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Survey submitted successfully!')));
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error submitting survey: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 50),
                    Image(image: AssetImage(AppAssets.logoWithoutText), height: 100, width: 100),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SHAHEEN SERVICES', style: TextsTheme().heading2sytle),
                        Text(
                          'HSE DEPARTMENT',
                          style: TextsTheme().heading3sytle.copyWith(color: ColorsTheme().iconColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(textAlign: TextAlign.right, SurveyForm1Texts.formTexttitle, style: TextsTheme().urduHeading1sytle),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.right,
                  SurveyForm1Texts.formTextTitleDescription,
                  style: TextsTheme().urduHeading2sytle,
                ),

                SizedBox(height: 20),
                Text(textAlign: TextAlign.right, SurveyForm1Texts.reportername, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                CustomTextField(controller: reporterNameController, hintText: ''),
                SizedBox(height: 10),
                Text(textAlign: TextAlign.right, SurveyForm1Texts.date, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select Date',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                      setState(() {
                        dateController.text = formattedDate;
                      });
                    }
                  },
                ),
                SizedBox(height: 10),

                Text(
                  textAlign: TextAlign.right,
                  SurveyForm1Texts.projectSiteName,
                  style: TextsTheme().urduHeading2sytle,
                ),
                SizedBox(height: 10),
                CustomTextField(controller: projectSiteController, hintText: ''),
                SizedBox(height: 10),

                Text(textAlign: TextAlign.right, SurveyForm1Texts.reportType, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                CustomTextField(controller: reportTypeController, hintText: ''),
                SizedBox(height: 10),

                Text(
                  textAlign: TextAlign.right,
                  SurveyForm1Texts.reportObservation,
                  style: TextsTheme().urduHeading2sytle,
                ),
                SizedBox(height: 10),
                CustomTextField(controller: reportObservationController, hintText: ''),
                SizedBox(height: 10),

                Text(textAlign: TextAlign.right, SurveyForm1Texts.possibilities, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                CustomTextField(controller: possibilitiesController, hintText: ''),
                SizedBox(height: 10),

                Text(textAlign: TextAlign.right, SurveyForm1Texts.actionReview, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                SizedBox(height: 10),
                CustomTextField(controller: actionReviewController, hintText: ''),
                SizedBox(height: 10),
                RoundBotton(title: 'submit', height: 50, ontap: _submitSurvey),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
