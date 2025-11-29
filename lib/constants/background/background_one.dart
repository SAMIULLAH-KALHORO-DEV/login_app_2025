import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';
import 'dart:math' show pi;

/// A custom widget that draws a clean, corporate geometric pattern
/// using stacked rectangles and lines in the brand colors.
class GeometricBlockBackground extends StatelessWidget {
  const GeometricBlockBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size.infinite, painter: _GeometricBlockPainter());
  }
}

class _GeometricBlockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // --- 1. Large, Subtle Light Blue Block (Base Accent) ---
    final lightBluePaint = Paint()
      ..color = AppColors.dataViz2
          .withOpacity(0.5) // Light Blue support color
      ..style = PaintingStyle.fill;

    // Draw a large, slightly rotated block starting from the top right
    final path1 = Path()
      ..moveTo(size.width * 0.75, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.45)
      ..lineTo(size.width * 0.45, size.height * 0.20) // Diagonal cut
      ..close();
    canvas.drawPath(path1, lightBluePaint);

    // --- 2. Corporate Blue Accent Line (Stability) ---
    final blueLinePaint = Paint()
      ..color = AppColors.dataViz1
          .withOpacity(0.7) // Corporate Blue
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    // Draw a thick, curving line across the middle
    // final path2 = Path()
    //   ..moveTo(0, size.height * 0.45)
    //   ..quadraticBezierTo(size.width * 0.3, size.height * 0.40, size.width * 0.6, size.height * 0.55)
    //   ..quadraticBezierTo(size.width * 0.9, size.height * 0.70, size.width, size.height * 0.65);
    // canvas.drawPath(path2, blueLinePaint);

    // --- 3. Shaheen Red Interaction Corner (Focus/Action) ---
    final redPaint = Paint()
      ..color = AppColors.primaryInteraction
          .withOpacity(0.8) // Shaheen Red
      ..style = PaintingStyle.fill;

    // Draw a smaller action triangle in the bottom left corner
    final path3 = Path()
      ..moveTo(0, size.height * 0.85)
      ..lineTo(size.width * 0.20, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path3, redPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
