import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/utils/utils.dart';

class FumigationServicesMonthlyList extends StatefulWidget {
  const FumigationServicesMonthlyList({super.key});

  @override
  State<FumigationServicesMonthlyList> createState() => _FumigationServicesMonthlyListState();
}

class _FumigationServicesMonthlyListState extends State<FumigationServicesMonthlyList> {
  final CollectionReference monthlyCard = FirebaseFirestore.instance.collection('FumigationMonthlyCard');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monthly Fumigation Services', style: TextsTheme().heading2sytle)),
      body: StreamBuilder<QuerySnapshot>(
        stream: monthlyCard.orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Add month'));
          }

          final items = snapshot.data!.docs;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final doc = items[index];
              final data = doc.data() as Map<String, dynamic>;
              final monthName = data['monthname'];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 2,
                child: ListTile(
                  title: Text(monthName, style: TextsTheme().heading2sytle),
                  subtitle: Text(
                    'Fumigation Services',
                    style: TextsTheme().heading3sytle.copyWith(color: const Color(0x73000000)),
                  ),

                  trailing: IconButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance.collection("SurveyForms").doc(doc.id).delete();

                      // Utils().toastMessage('');
                    },
                    icon: const Icon(Icons.delete, size: 18),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => FumigationServicesMonthlyList()));
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMonthCard()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// SnackBar
class AddMonthCard extends StatefulWidget {
  const AddMonthCard({super.key});

  @override
  State<AddMonthCard> createState() => _AddMonthCardState();
}

class _AddMonthCardState extends State<AddMonthCard> {
  final CollectionReference monthlyCard = FirebaseFirestore.instance.collection('FumigationMonthlyCard');
  final TextEditingController addmonthNameController = TextEditingController();

  void _addMonth() async {
    try {
      await monthlyCard.add({
        'monthname': addmonthNameController.text.trim(),
        'timestamp': DateTime.now().toIso8601String(),
      });
      addmonthNameController.clear();

      // Show Snackbar from bottom
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Month Added successfully!'), duration: Duration(seconds: 2)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), duration: Duration(seconds: 2)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Month')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: addmonthNameController,
              decoration: InputDecoration(hintText: 'Enter Month Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _addMonth, child: Text('Add Month')),
          ],
        ),
      ),
    );
  }
}
