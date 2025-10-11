import 'package:flutter/material.dart';
import 'package:login_app_2025/ui/auth/varify_code.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:login_app_2025/widgets/round_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  @override
  final phoneNumberController = TextEditingController();
  bool looding = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login With Phone Number")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(hintText: '+1 234 567 8901'),
            ),
            SizedBox(height: 30),
            RoundBotton(
              title: 'Login',
              height: 60,
              ontap: () {
                auth.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_) {},
                  verificationFailed: (e) {
                    Utils().toastMessage(e.toString());
                  },
                  codeSent: (String varificationId, int? token) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerifyCodeScreen(verificationId: varificationId)),
                    );
                  },
                  codeAutoRetrievalTimeout: (e) {
                    Utils().toastMessage(e.toString());
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
