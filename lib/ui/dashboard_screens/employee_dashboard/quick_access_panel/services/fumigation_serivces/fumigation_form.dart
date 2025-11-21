import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/widgets/custom_text_field_widget.dart';
import 'package:login_app_2025/widgets/round_botton.dart';

class FumigationForm extends StatefulWidget {
  final String? monthDocId;
  const FumigationForm({super.key, this.monthDocId});

  @override
  State<FumigationForm> createState() => _FumigationFormState();
}

class _FumigationFormState extends State<FumigationForm> {
  final TextEditingController snoController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController technicianController = TextEditingController();

  void _submitFumigationService() async {
    try {
      await FirebaseFirestore.instance
          .collection('FumigationMonthlyCard')
          .doc(widget.monthDocId)
          .collection('FumigationServices')
          .add({
            'sno': snoController.text.trim(),
            'date': dateController.text.trim(),
            'service': serviceController.text.trim(),
            'site': siteController.text.trim(),
            'location': locationController.text.trim(),
            'status': statusController.text.trim(),
            'technician': technicianController.text.trim(),
            'timestamp': DateTime.now().toIso8601String(),
          });

      snoController.clear();
      dateController.clear();
      serviceController.clear();
      siteController.clear();
      locationController.clear();
      statusController.clear();
      technicianController.clear();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fumigation service added successfully!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding fumigation service: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Fumigation Service', style: TextsTheme().heading2sytle)),
      body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextField(controller: snoController, hintText: 'S.No.'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: dateController, hintText: 'Date'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: serviceController, hintText: 'Service'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: siteController, hintText: 'Site'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: locationController, hintText: 'Location'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: statusController, hintText: 'Status'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: technicianController, hintText: 'Technician'),
                    const SizedBox(height: 20),
                    RoundBotton(title: 'Submit', ontap: _submitFumigationService, height: 40,),
                  ],
                ),
              ),
            ),
    );
  }
}
