import 'package:flutter/material.dart';
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
              title: 'Add',
              height: 60,
              ontap: () {
                databaseRef.child('1').set({'id': '1'});
              },
            ),
          ],
        ),
      ),
    );
  }
}
