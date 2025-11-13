import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_assets.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/constants/survey_forms_texts/survey_form1_texts.dart';
import 'package:login_app_2025/ui/quick_access_panel/Surveys/survey_forms.dart/widgets/custom_text_field_widget.dart';
import 'package:login_app_2025/widgets/round_botton.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class SurveyForm1 extends StatefulWidget {
  const SurveyForm1({super.key});

  @override
  State<SurveyForm1> createState() => _SurveyForm1State();
}

final dateController = TextEditingController();

class _SurveyForm1State extends State<SurveyForm1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(height: 10),

                CustomTextField(hintText: ''),
                SizedBox(height: 10),
                Text(textAlign: TextAlign.right, SurveyForm1Texts.reportername, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                CustomTextField(hintText: ''),
                SizedBox(height: 10),
                Text(textAlign: TextAlign.right, SurveyForm1Texts.date, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                CustomTextField(hintText: ''),
                SizedBox(height: 10),

                Text(
                  textAlign: TextAlign.right,
                  SurveyForm1Texts.projectSiteName,
                  style: TextsTheme().urduHeading2sytle,
                ),
                SizedBox(height: 10),
                CustomTextField(hintText: ''),
                SizedBox(height: 10),

                Text(textAlign: TextAlign.right, SurveyForm1Texts.reportType, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                CustomTextField(hintText: ''),
                SizedBox(height: 10),

                Text(
                  textAlign: TextAlign.right,
                  SurveyForm1Texts.reportObservation,
                  style: TextsTheme().urduHeading2sytle,
                ),
                SizedBox(height: 10),
                CustomTextField(hintText: ''),
                SizedBox(height: 10),

                Text(textAlign: TextAlign.right, SurveyForm1Texts.possibilities, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                CustomTextField(hintText: ''),
                SizedBox(height: 10),

                Text(textAlign: TextAlign.right, SurveyForm1Texts.actionReview, style: TextsTheme().urduHeading2sytle),
                SizedBox(height: 10),
                SizedBox(height: 10),
                CustomTextField(hintText: ''),
                SizedBox(height: 10),
                RoundBotton(title: 'submit', height: 50, ontap: () {}),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
