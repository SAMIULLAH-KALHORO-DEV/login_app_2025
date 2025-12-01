import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

// --- Placeholder/Shim for missing project classes (AppColors) ---

// --- End Shims ---

class ComplianceAlertsCard extends StatelessWidget {
  const ComplianceAlertsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(CupertinoIcons.exclamationmark_triangle_fill, color: AppColors.dataViz3, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Urgent Compliance Alerts',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, color: AppColors.dataViz3),
                ),
              ],
            ),
            const Divider(height: 20),
            Text(
              '3 employees have expired safety certifications (Fire Safety). Action required to prevent assignment to high-risk jobs.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  /* Navigate to Compliance Check List */
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.dataViz3,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('MANAGE ALERTS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
