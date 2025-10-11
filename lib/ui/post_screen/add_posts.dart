import 'package:flutter/material.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:login_app_2025/widgets/round_botton.dart';
import 'package:firebase_database/firebase_database.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Posts');
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Post")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextFormField(
              controller: postController,
              decoration: InputDecoration(hintText: 'Whats on your mind?', border: OutlineInputBorder()),
              maxLines: 3,
            ),
            SizedBox(height: 30),
            RoundBotton(
              loading: loading,
              title: 'Add',
              height: 60,
              ontap: () {
                setState(() {
                  loading = true;
                });
                databaseRef
                    .child(DateTime.now().microsecondsSinceEpoch.toString())
                    .set({
                      'description': postController.text.toString(),
                      'id': DateTime.now().microsecondsSinceEpoch.toString(),
                    })
                    .then(
                      (value) {
                        Utils().toastMessage('Post added');
                        setState(() {
                          loading = false;
                        });
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
    );
  }
}
