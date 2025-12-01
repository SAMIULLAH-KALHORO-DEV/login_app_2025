import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/utils/utils.dart';

class ProfileSectionAdmin extends StatefulWidget {
  const ProfileSectionAdmin({super.key});

  @override
  State<ProfileSectionAdmin> createState() => _ProfileSectionAdminState();
}

class _ProfileSectionAdminState extends State<ProfileSectionAdmin> {
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

  @override
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.dataViz4.withAlpha(200),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, offset: const Offset(0, 3))],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Team Overview',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '24 Active Field Employees',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Icon(CupertinoIcons.group_solid, color: Colors.white, size: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
