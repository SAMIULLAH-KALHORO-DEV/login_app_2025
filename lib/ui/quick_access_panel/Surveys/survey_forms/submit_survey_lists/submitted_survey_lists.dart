import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/quick_access_panel/Surveys/survey_forms/submit_survey_lists/submitted_survey_details.dart';
// make this file next

class SurveyListPage extends StatefulWidget {
  const SurveyListPage({super.key});

  @override
  State<SurveyListPage> createState() => _SurveyListPageState();
}

class _SurveyListPageState extends State<SurveyListPage> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('SurveyForms');
  final refuser = FirebaseDatabase.instance.ref('Users');
  Future<String> getUsername(String uid) async {
    final snapshot = await refuser.child(uid).get();
    if (snapshot.exists) {
      return snapshot.child('username').value.toString();
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submitted Surveys')),
      body: StreamBuilder(
        stream: ref.onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
            return const Center(child: Text('No surveys found'));
          }

          final data = Map<String, dynamic>.from((snapshot.data! as DatabaseEvent).snapshot.value as Map);

          final items = data.entries.toList().reversed.toList();

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final id = items[index].key;
              final value = Map<String, dynamic>.from(items[index].value);

              final reporterName = value['reporterName'] ?? 'Unknown';
              final date = value['date'] ?? '';

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 2,
                child: ListTile(
                  title: Text(reporterName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: FutureBuilder<String>(
                    future: getUsername(FirebaseAuth.instance.currentUser!.uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading...', style: TextsTheme().heading3sytle);
                      } else if (snapshot.hasError) {
                        return Text('Error', style: TextsTheme().heading3sytle);
                      } else {
                        return Text(snapshot.data ?? 'Unknown', style: TextsTheme().heading3sytle);
                      }
                    },
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SurveyDetailPage(surveyId: id!, data: value),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
