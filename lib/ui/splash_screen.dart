import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_assets.dart';
import 'package:login_app_2025/firebaseServices/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashscreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashscreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppAssets.logo)),
            SizedBox(height: 40),
            Text(
              'Our Vision',
              style: TextStyle(
                fontFamily: 'manrope',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              AppAssets.usbtext,
              style: TextStyle(fontFamily: 'manrope', fontSize: 20, color: Color.fromARGB(134, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }
}
