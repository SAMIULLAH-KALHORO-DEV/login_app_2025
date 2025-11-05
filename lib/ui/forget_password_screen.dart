import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:login_app_2025/widgets/round_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 30),
            RoundBotton(
              title: 'Forget',
              height: 50,
              ontap: () {
                auth
                    .sendPasswordResetEmail(email: emailController.text.toString())
                    .then((value) {
                      Timer(Duration(seconds: 2), () {
                        Utils().toastMessage('We have send you an email to recover your password');
                      });
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
