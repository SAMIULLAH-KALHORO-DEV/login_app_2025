import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/constants/app_theme.dart';
import 'package:login_app_2025/constants/app_assets.dart';
import 'package:login_app_2025/constants/background/background_one.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:login_app_2025/widgets/round_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final rolecontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('Users');

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    rolecontroller.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  void SignUp() {
    setState(() {
      loading = true;
      Utils().toastMessage('Processing Data');
    });
    _auth
        .createUserWithEmailAndPassword(
          email: emailcontroller.text.toString(),
          password: passwordcontroller.text.toString(),
        )
        .then((value) async {
          await _usersCollection.doc(value.user!.uid).set({
            'role': role,
            'email': emailcontroller.text.toString(),
            'username': usernamecontroller.text.toString(),
            'uid': value.user!.uid,
          });

          setState(() {
            loading = false;
          });
          Utils().toastMessage('Account created successfully');
        })
        .catchError((error, stackTrace) {
          Utils().toastMessage(error.toString());
          setState(() {
            loading = false;
          });
        });
  }

  var options = ['Admin', 'Employee'];
  var _currentItemSelected = "Admin";
  var role = "Admin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          const GeometricBlockBackground(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text('SigUp', style: TextsTheme().heading1sytle),
                    Image(image: AssetImage(AppAssets.logogif), height: 140, width: 140),
                    SizedBox(height: 20),
                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create Your Account',
                            style: PastelDuskTheme.light.textTheme.headlineLarge!.copyWith(
                              fontSize: 24,
                              fontFamily: 'manrope',
                            ),
                          ),
                          SizedBox(height: 5),

                          // role based login dropdown
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorsTheme().borderColor),
                            ),
                            child: DropdownButton<String>(
                              alignment: AlignmentGeometry.centerRight,
                              style: TextsTheme().heading3sytle.copyWith(color: ColorsTheme().borderColor),
                              dropdownColor: const Color(0xFFF5F5F7),
                              // isDense: true,
                              isExpanded: false,
                              iconEnabledColor: ColorsTheme().borderColor,
                              focusColor: const Color.fromARGB(255, 48, 38, 38),
                              items: options.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelected = newValueSelected!;
                                  role = newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ),

                          // user name text field
                          SizedBox(height: 20),
                          // Text('User Name', style: TextsTheme().heading2sytle),
                          SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: usernamecontroller,

                            decoration: InputDecoration(
                              labelText: 'User Name ie. sami, kashif',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
                              ),
                              suffixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          // Text('Email', style: TextsTheme().heading2sytle),
                          SizedBox(height: 5),

                          // email text field
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailcontroller,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
                              ),
                              suffixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          // Text('Password', style: TextsTheme().heading2sytle),
                          // password text field
                          TextFormField(
                            controller: passwordcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Add Password',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
                              ),
                              suffixIcon: Icon(Icons.person),
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
                    SizedBox(height: 30),
                    RoundBotton(
                      loading: loading,
                      title: 'Sign Up',
                      // height: 50,
                      ontap: () {
                        if (_formkey.currentState!.validate()) {
                          // Handle login
                          SignUp();
                          // Navigator.pop(context);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
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
