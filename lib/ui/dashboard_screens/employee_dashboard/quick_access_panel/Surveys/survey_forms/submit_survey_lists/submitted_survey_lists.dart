import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/Surveys/survey_forms/submit_survey_lists/submitted_survey_details.dart';
// make this file next

class SubmittedSurveyList extends StatefulWidget {
  const SubmittedSurveyList({super.key});

  @override
  State<SubmittedSurveyList> createState() => _SubmittedSurveyListState();
}

class _SubmittedSurveyListState extends State<SubmittedSurveyList> {
  final CollectionReference surveyCollection = FirebaseFirestore.instance.collection('SurveyForms');
  // final refuser = FirebaseDatabase.instance.ref('Users');

  // Future<String> getuUsername(String uid) async {
  //   final snapshot = await refuser.child(uid).get();
  //   if (snapshot.exists) {
  //     return snapshot.child('username').value.toString();
  //   } else {
  //     return 'Unknown';
  //   }
  // }

  Future<String> getUsername(String uid) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('Users') // your Firestore collection
        .doc(uid)
        .get();

    if (docSnapshot.exists) {
      return docSnapshot.get('username').toString();
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submitted Surveys')),
      body: StreamBuilder<QuerySnapshot>(
        stream: surveyCollection.orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No surveys found'));
          }

          final items = snapshot.data!.docs;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final doc = items[index];
              final data = doc.data() as Map<String, dynamic>;
              final reporterName = data['reporterName'];
              final date = data['date'] ?? '';

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 2,
                child: ListTile(
                  title: Text(reporterName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Text(date, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11)),
                  // subtitle: FutureBuilder<String>(
                  //   future: getUsername(FirebaseAuth.instance.currentUser!.uid),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Text('Loading...', style: TextsTheme().heading3sytle);
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error', style: TextsTheme().heading3sytle);
                  //     } else {
                  //       return Text(snapshot.data ?? 'Unknown', style: TextsTheme().heading3sytle);
                  //     }
                  //   },
                  // ),
                  trailing: IconButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance.collection("SurveyForms").doc(doc.id).delete();


                      // Utils().toastMessage('');
                    },
                    icon: const Icon(Icons.delete, size: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SurveyDetailPage(surveyId: doc.id, data: data),
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
