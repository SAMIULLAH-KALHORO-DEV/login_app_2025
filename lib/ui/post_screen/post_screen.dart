import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/ui/post_screen/add_posts.dart';
import 'package:login_app_2025/utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
        actions: [
          IconButton(
            onPressed: () {
              auth
                  .signOut()
                  .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  })
                  .onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
            },
            icon: Icon(Icons.logout_outlined),
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
