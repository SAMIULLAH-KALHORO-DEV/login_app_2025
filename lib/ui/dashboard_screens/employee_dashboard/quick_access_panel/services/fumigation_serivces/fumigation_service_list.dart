import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/dashboard_screens/employee_dashboard/quick_access_panel/services/fumigation_serivces/fumigation_form.dart';

class FumigationServiceList extends StatefulWidget {
  final String monthDocId;
  final String monthName;
  const FumigationServiceList({super.key, required this.monthDocId, required this.monthName});

  @override
  State<FumigationServiceList> createState() => _FumigationServiceListState();
}

class _FumigationServiceListState extends State<FumigationServiceList> {
  late CollectionReference fumigationServicesCollection;

  @override
  void initState() {
    super.initState();
    fumigationServicesCollection = FirebaseFirestore.instance.collection('FumigationServices');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.monthName} Fumigation Services', style: TextsTheme().heading2sytle)),
      body: StreamBuilder<QuerySnapshot>(
        stream: fumigationServicesCollection.orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No fumigation services found for this month.'));
          }

          final items = snapshot.data!.docs;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final doc = items[index];
              final data = doc.data() as Map<String, dynamic>;

              return Dismissible(
                key: Key(doc.id),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) async {
                  await fumigationServicesCollection.doc(doc.id).delete();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${data['service']} deleted')));
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance.collection("FumigationServices").doc(doc.id).delete();
                      },
                      icon: Icon(Icons.delete),
                    ),
                    title: Text(
                      data['service'] ?? 'No Service Name',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('S.no: ${data['sno'] ?? ''}'),
                        Text('Date: ${data['date'] ?? ''}'),
                        Text('Site: ${data['site'] ?? ''}'),
                        Text('Location: ${data['location'] ?? ''}'),
                        Text('Status: ${data['status'] ?? ''}'),
                        Text('Technician: ${data['technician'] ?? ''}'),
                      ],
                    ),
                    onTap: () {
                      // Handle tap to view details or edit
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FumigationForm(monthDocId: widget.monthDocId)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
