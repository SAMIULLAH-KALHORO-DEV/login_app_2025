import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app_2025/constants/app_assets.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/constants/background/background_one.dart';
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
      body: Stack(
        children: [
          const GeometricBlockBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // company logo
                    Image(image: AssetImage(AppAssets.loginImage), height: 170, width: 170),

                    Text('Welcome Back!', style: PastelDuskTheme.light.textTheme.displayLarge!.copyWith(fontSize: 24)),
                    SizedBox(height: 20),
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
                              labelStyle: TextStyle(color: AppColors.secondaryTextHint),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColors.cardBorderColor, width: 1),
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
                              labelStyle: TextStyle(color: AppColors.secondaryTextHint),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: AppColors.cardBorderColor, width: 1),
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
                        : RoundBotton(title: 'Login', height: 40, ontap: loginUser),

                    Align(
                      alignment: AlignmentGeometry.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                        },
                        child: Text('Forget Password'),
                      ),
                    ),
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
                    // SizedBox(height: 15),
                    RoundBotton(
                      ontap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPhoneNumber()));
                      },
                      title: 'login with phone number',
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Shaheen Services Pvt Ltd. All Rights Reserved @2025',
                      style: PastelDuskTheme.light.textTheme.displaySmall!.copyWith(
                        color: AppColors.secondaryTextHint,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
