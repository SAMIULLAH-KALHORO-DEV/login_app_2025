import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/Theme.dart';

class RoundBotton extends StatelessWidget {
  final VoidCallback ontap;
  final bool loading;
  final String title;
  final double height;
  const RoundBotton({super.key, required this.title, required this.height, this.loading = false, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height,

        decoration: ContainerTheme().containerTheme1,

        child: Center(
          child: loading
              ? CircularProgressIndicator(strokeWidth: 3, color: Colors.white)
              : Text(title, style: TextsTheme().heading2sytle),
        ),
      ),
    );
  }
}
