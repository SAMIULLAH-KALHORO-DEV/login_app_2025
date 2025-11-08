import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/Theme.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/utils/utils.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  final auth = FirebaseAuth.instance;
  final refuser = FirebaseDatabase.instance.ref('Users');
  final editController = TextEditingController();

  Future<String> getUsername(String uid) async {
    final snapshot = await refuser.child(uid).get();
    if (snapshot.exists) {
      return snapshot.child('username').value.toString();
    } else {
      return 'Unknown';
    }
  }

  Future<String> getRole(String uid) async {
    final snapshot = await refuser.child(uid).get();
    if (snapshot.exists) {
      return snapshot.child('role').value.toString();
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: ContainerTheme().containerTheme1,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: ColorsTheme().borderColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(CupertinoIcons.person),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<String>(
                        future: getUsername(FirebaseAuth.instance.currentUser!.uid),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text('Loading...', style: TextsTheme().heading2sytle);
                          } else if (snapshot.hasError) {
                            return Text('Error', style: TextsTheme().heading2sytle);
                          } else {
                            return Text(snapshot.data ?? 'Unknown', style: TextsTheme().heading2sytle);
                          }
                        },
                      ),
                      FutureBuilder<String>(
                        future: getRole(FirebaseAuth.instance.currentUser!.uid),
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
                    ],
                  ),
                ],
              ),

              IconButton(
                onPressed: () {
                  auth
                      .signOut()
                      .then((value) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      })
                      .onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });
                },
                icon: Icon(Icons.logout_outlined, color: ColorsTheme().iconColor),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(CupertinoIcons.search),

              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
