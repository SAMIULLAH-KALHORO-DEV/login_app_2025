import 'package:flutter/material.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:login_app_2025/widgets/round_botton.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Posts');
  final auth = FirebaseDatabase.instance;
  final postController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Send a Message")),
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
                title: 'send',
                height: 60,
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  String id = DateTime.now().microsecondsSinceEpoch.toString();
                  databaseRef
                      .child(id)
                      .set({'title': postController.text.toString(), 'id': id, 'userid': user!.uid})
                      .then(
                        (value) {
                          Utils().toastMessage('Send message');
                          setState(() {
                            loading = false;
                          });
                          postController.clear();
                          Navigator.pop(context);
                        },
                        onError: (error, stackTrace) {
                          Utils().toastMessage(error.toString());
                          setState(() {
                            loading = false;
                          });
                        },
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
