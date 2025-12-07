import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// --- Placeholder for AppColors from constants/app_theme.dart ---
// Mapped to your provided color palette (Deep Primary/Base and Accent 4)
class AppColorrs {
  // Deep Primary/Base (Dark Violet) - Used here for high-impact background
  static const Color corporatePrimary = Color(0xFF493B7A);
  // Accent 4 (Vibrant Pink/Magenta) - Used here for the loading indicator accent
  static const Color corporateAccent = Color(0xFFA65E9A);
}
// --- End Placeholder ---

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the Deep Primary/Base color for a strong, corporate look
      backgroundColor: AppColorrs.corporatePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Company Logo/Icon Area
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColorrs.corporateAccent.withOpacity(0.9), // Highlighted with Accent 4
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColorrs.corporateAccent.withOpacity(0.4),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              // Icon representing facility management/building services
              child: const Icon(CupertinoIcons.building_2_fill, size: 64, color: Colors.white),
            ),
            const SizedBox(height: 36),

            // 2. Main Company Name
            const Text(
              'SHAHEEN SERVICES LTD',
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: 2),
            ),
            const SizedBox(height: 8),

            // 3. System Tagline
            Text(
              'Facility Management System',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 80),

            // 4. Loading Indicator
            CupertinoActivityIndicator(
              color: AppColorrs.corporateAccent, // Branded loading color
              radius: 18,
            ),
            const SizedBox(height: 12),

            // 5. System Status
            Text('Checking User Credentials...', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
