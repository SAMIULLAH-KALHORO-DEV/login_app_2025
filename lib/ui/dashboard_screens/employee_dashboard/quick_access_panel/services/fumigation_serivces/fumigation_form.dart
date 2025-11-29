import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/constants/validators.dart';
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
    if (!_formKey.currentState!.validate()) return; // stops submit

    try {
      final docRef = FirebaseFirestore.instance.collection('FumigationServices').doc();

      String docId = docRef.id;

      await docRef.set({
        'docId': docId,
        'sno': snoController.text.trim(),
        'date': dateController.text.trim(),
        'service': serviceController.text.trim(),
        'site': siteController.text.trim(),
        'location': locationController.text.trim(),
        'status': statusController.text.trim(),
        'technician': technicianController.text.trim(),
        'timestamp': DateTime.now().toIso8601String(),
      });

      dateController.clear();
      serviceController.clear();
      siteController.clear();
      locationController.clear();
      statusController.clear();
      technicianController.clear();

      // auto set next sno again
      setNextSno();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fumigation service added successfully!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding fumigation service: $e')));
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setNextSno();
  }

  Future<void> setNextSno() async {
    final snapshot = await FirebaseFirestore.instance.collection('FumigationServices').get();
    int count = snapshot.docs.length; // eg 5 card submitted
    int nextSno = count + 1; // next is 6
    snoController.text = nextSno.toString();
  }

  @override
  Widget build(BuildContext context) {
    final TextFieldValidator validator = TextFieldValidator();

    return Scaffold(
      appBar: AppBar(title: Text('Fumigation Service', style: TextsTheme().heading2sytle)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Fumigation Service Form', style: Theme.of(context).textTheme.headlineSmall!.copyWith()),
              const SizedBox(height: 20),

              Form(
                key: _formKey,

                child: Column(
                  children: [
                    CustomTextField(
                      controller: snoController,
                      hintText: 'S.No.',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return null;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: serviceController,
                      lebelText: 'Service',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: siteController,
                      lebelText: 'Site',
                      validator: (value) {
                        return validator.validateEmptyField(value, 'please enter site name');
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(controller: locationController, lebelText: 'Location'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: statusController, lebelText: 'Status'),
                    const SizedBox(height: 10),
                    CustomTextField(controller: technicianController, lebelText: 'Technician'),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              RoundBotton(title: 'Submit', ontap: _submitFumigationService, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
