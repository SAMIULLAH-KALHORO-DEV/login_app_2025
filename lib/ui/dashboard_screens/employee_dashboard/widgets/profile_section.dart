import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/utils/utils.dart';

class ProfileSectionEmpolyee extends StatefulWidget {
  const ProfileSectionEmpolyee({super.key});

  @override
  State<ProfileSectionEmpolyee> createState() => _ProfileSectionEmpolyeeState();
}

class _ProfileSectionEmpolyeeState extends State<ProfileSectionEmpolyee> {
  final auth = FirebaseAuth.instance;
  final usersCollection = FirebaseFirestore.instance.collection('Users');
  final editController = TextEditingController();

  Future<String> getUsername(String uid) async {
    try {
      final doc = await usersCollection.doc(uid).get();
      if (doc.exists) {
        final data = doc.data();
        return (data != null && data['username'] != null) ? data['username'].toString() : 'Unknown';
      } else {
        return 'Unknown';
      }
    } catch (e) {
      return 'Unknown';
    }
  }

  Future<String> getRole(String uid) async {
    try {
      final doc = await usersCollection.doc(uid).get();
      if (doc.exists) {
        final data = doc.data();
        return (data != null && data['role'] != null) ? data['role'].toString() : 'Unknown';
      } else {
        return 'Unknown';
      }
    } catch (e) {
      return 'Unknown';
    }
  }
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.baseAccentShadows,

      color: PastelDuskTheme.light.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        Text('Welcome Back!'),
                        FutureBuilder<String>(
                          future: getUsername(FirebaseAuth.instance.currentUser!.uid),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Text(
                                'Loading...',
                                style: PastelDuskTheme.light.textTheme.titleLarge!.copyWith(fontSize: 20),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                'Error',
                                style: PastelDuskTheme.light.textTheme.titleLarge!.copyWith(fontSize: 20),
                              );
                            } else {
                              return Text(
                                snapshot.data ?? 'Unknown',
                                style: PastelDuskTheme.light.textTheme.titleLarge!.copyWith(
                                  fontSize: 20,
                                  color: AppColors.primaryText,
                                ),
                              );
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
                        Row(
                          children: [
                            Text(
                              "Status:",
                              style: TextStyle(color: AppColors.secondaryTextHint, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Online",
                              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 6),
                            Icon(Icons.circle, size: 12, color: Colors.green),
                          ],
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
          ],
        ),
      ),
    );
  }
}
