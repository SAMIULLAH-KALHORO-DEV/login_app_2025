import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      body: StreamBuilder<QuerySnapshot>(
        stream: monthlyCard.orderBy('timestamp', descending: true).snapshots(),
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
              final monthName = data['monthname'];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 2,
                child: ListTile(
                  title: Text('', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Text(monthName, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11)),

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
                        builder: (_) => FumigationServicesMonthlyList(),
                      ),
                    );
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
  // Future
  void _fumigationServicesMonthlyList() async {
    try {
      await monthlyCard.add({'monthname': addmonthNameController.text.trim()});

      // clear all fields
      addmonthNameController.clear();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Month Added successfully!')));
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error submitting: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Column(
        children: [
          TextField(
            controller: addmonthNameController,
            decoration: InputDecoration(hintText: 'Enter Month Name'),
          ),
          ElevatedButton(
            onPressed: () {
              _fumigationServicesMonthlyList();
              Utils().toastMessage('Month Added');
            },
            child: Text('Add Month'),
          ),
        ],
      ),
    );
  }
}
