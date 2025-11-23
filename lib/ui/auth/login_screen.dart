import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app_2025/constants/app_assets.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/constants/validators.dart';
import 'package:login_app_2025/ui/auth/forget_password_screen.dart';
import 'package:login_app_2025/ui/auth/login_with_phone_number.dart';
import 'package:login_app_2025/ui/auth/signup_screen.dart';
import 'package:login_app_2025/widgets/round_botton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> loginUser() async {
    setState(() => isLoading = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      String uid = userCredential.user!.uid;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();

      if (!userDoc.exists) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User data not found.")));
        return;
      }

      String role = userDoc['role'];

      setState(() => isLoading = false);

      // Navigate based on role
      if (role == 'Admin') {
        Navigator.pushReplacementNamed(context, '/adminHome');
      } else if (role == 'Employee') {
        Navigator.pushReplacementNamed(context, '/employeeHome');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Unknown role.")));
      }
    } on FirebaseAuthException catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "Login failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextFieldValidator validator = TextFieldValidator();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Login', style: TextsTheme().heading1sytle),

                SizedBox(height: 20),
                // company logo
                Image(image: AssetImage(AppAssets.logo), height: 150, width: 150),
                // email field
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          return validator.validateEmail(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // password field
                      TextFormField(
                        validator: (value) {
                          return validator.validatePassword(value);
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
                          ),
                        ),

                        obscureText: true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                isLoading
                    ? const CircularProgressIndicator()
                    : RoundBotton(title: 'Login', height: 50, ontap: loginUser),

                Align(
                  alignment: AlignmentGeometry.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                    },
                    child: Text('Forget Password'),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPhoneNumber()));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text('Login with Phone number')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}