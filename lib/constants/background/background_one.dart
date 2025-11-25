import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

class DiagonalWaveBackground2 extends StatelessWidget {
  const DiagonalWaveBackground2({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size.infinite, painter: _DiagonalWavePainter2());
  }
}

class _DiagonalWavePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1: Base soft pastel - purple
    final paint1 = Paint()
      ..color = AppColors.baseAccentShadows.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    final path1 = Path()
      ..moveTo(0, size.height * 0.85)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.70, size.width * 0.50, size.height * 0.80)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.90, size.width, size.height * 0.75)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path1, paint1);

    // Layer 2: Middle vibrant pastel - pink
    final paint2 = Paint()
      ..color = AppColors.dataViz1.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final path2 = Path()
      ..moveTo(0, size.height * 0.65)
      ..quadraticBezierTo(size.width * 0.20, size.height * 0.50, size.width * 0.45, size.height * 0.60)
      ..quadraticBezierTo(size.width * 0.70, size.height * 0.70, size.width, size.height * 0.55)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path2, paint2);

    // Layer 3: Top pastel - light blue, with stroke
    final paint3Fill = Paint()
      ..color = AppColors.dataViz4.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    final paint3Stroke = Paint()
      ..color = AppColors.dataViz4.withOpacity(0.7)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path3 = Path()
      ..moveTo(0, size.height * 0.50)
      ..quadraticBezierTo(size.width * 0.30, size.height * 0.35, size.width * 0.55, size.height * 0.45)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.55, size.width, size.height * 0.35);

    final path3Fill = Path.from(path3)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path3Fill, paint3Fill);
    canvas.drawPath(path3, paint3Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
