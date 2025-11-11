import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app_2025/constants/Theme.dart';
import 'package:login_app_2025/constants/app_assets.dart';
import 'package:login_app_2025/ui/auth/login_with_phone_number.dart';
import 'package:login_app_2025/ui/auth/signup_screen.dart';
import 'package:login_app_2025/ui/dashboard_screens/admin_dashboard.dart';
import 'package:login_app_2025/ui/forget_password_screen.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:login_app_2025/widgets/round_botton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool loading = false;

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text)
        .then((value) {
          Utils().toastMessage(value.user!.email.toString());
          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
          setState(() {
            loading = false;
          });
        })
        .onError((error, stackTrace) {
          debugPrint(error.toString());
          Utils().toastMessage(error.toString());

          setState(() {
            loading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Login', style: TextsTheme().heading1sytle),
                  SizedBox(height: 20),
                  Image(image: AssetImage(AppAssets.logo), height: 150, width: 150),

                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordcontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  RoundBotton(
                    loading: loading,
                    title: 'Login',
                    height: 50,
                    ontap: () {
                      if (_formkey.currentState!.validate()) {
                        // Handle login
                        login();
                      }
                    },
                  ),
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
      ),
    );
  }
}
