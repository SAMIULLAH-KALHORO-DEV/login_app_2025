import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/Theme.dart';
import 'package:login_app_2025/constants/app_assets.dart';
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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref('Users');

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
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
          // Save username in Realtime Database
          await _database.child(value.user!.uid).set({
            'email': emailcontroller.text.toString(),
            'username': usernamecontroller.text.toString(),
            'uid': value.user!.uid,
          });

          setState(() {
            loading = false;
          });
          Utils().toastMessage('Account created successfully');
        })
        // ignore: avoid_types_as_parameter_names
        .onError((error, stackTrace) {
          Utils().toastMessage(error.toString());
          setState(() {
            loading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text('SignUp')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(AppAssets.logo), height: 150, width: 150),
              SizedBox(height: 20),
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Role', style: TextsTheme().heading2sytle),
                    SizedBox(height: 5),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        hintText: '',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
                        ),
                        suffixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Role';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text('User Name', style: TextsTheme().heading2sytle),
                    SizedBox(height: 5),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        hintText: '',
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
                    Text('Email', style: TextsTheme().heading2sytle),
                    SizedBox(height: 5),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: '',
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
                    Text('Password', style: TextsTheme().heading2sytle),

                    TextFormField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: '',
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
                height: 50,
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
    );
  }
}
