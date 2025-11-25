import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'package:login_app_2025/constants/app_theme.dart';

class RoundBotton extends StatelessWidget {
  final VoidCallback ontap;
  final bool loading;
  final String title;
  final double? height;
  const RoundBotton({super.key, required this.title, this.height, this.loading = false, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ElevatedButton(
        onPressed: ontap,
        style: PastelDuskTheme.light.elevatedButtonTheme.style,
        child: Container(
          height: height,

          // decoration: ContainerTheme().containerTheme1,
          child: Center(
            child: loading
                ? CircularProgressIndicator(strokeWidth: 3, color: ColorsTheme().borderColor)
                : Text(title, style: PastelDuskTheme.light.textTheme.titleLarge!.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
