import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:login_app_2025/widgets/round_botton.dart';

class AddFirestoreDataScreen extends StatefulWidget {
  const AddFirestoreDataScreen({super.key});

  @override
  State<AddFirestoreDataScreen> createState() => _AddFirestoreDataScreenState();
}

class _AddFirestoreDataScreenState extends State<AddFirestoreDataScreen> {
  // final databaseRef = FirebaseDatabase.instance.ref('Posts');
  // final auth = FirebaseDatabase.instance;
  // final user = FirebaseAuth.instance.currentUser;
  bool loading = false;
  final postController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add fireStore Data")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                controller: postController,
                decoration: InputDecoration(hintText: 'Whats on your mind?', border: OutlineInputBorder()),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter message';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              RoundBotton(
                loading: loading,
                title: 'add',
                height: 60,
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  fireStore
                      .doc(id)
                      .set({'title': postController.text.toString(), 'id': id})
                      .then((value) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage('post Added');
                      })
                      .onError((error, stackTrace) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage(error.toString());
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
