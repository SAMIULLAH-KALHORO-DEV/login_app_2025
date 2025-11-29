import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

// --- Placeholder/Shim for missing project classes (AppColors) ---

// --- End Shims ---

// Placeholder for a Checklist or Form Page
class ComplianceFormPage extends StatelessWidget {
  final String title;
  const ComplianceFormPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CupertinoNavigationBar(middle: Text(title)),
    body: Center(child: Text('Form/Checklist for: $title')),
  );
}

class ComplianceSafetyPage extends StatelessWidget {
  const ComplianceSafetyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('Compliance & Safety'),
        backgroundColor: AppColors.surfaceBackground,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Section 1: Immediate Safety Checks ---
            _buildSectionHeader(context, 'Safety Checklists & Sign-Offs'),
            _buildChecklistTile(
              context,
              title: 'PPE Checklist (Before Job Start)',
              subtitle: 'Ensure all Personal Protective Equipment is secured.',
              icon: CupertinoIcons.shield_lefthalf_fill,
              color: AppColors.primaryInteraction, // Red for urgent safety check
            ),
            _buildChecklistTile(
              context,
              title: 'Hazard Assessment Form (Site-Specific)',
              subtitle: 'Mandatory before working in high-risk areas.',
              icon: CupertinoIcons.exclamationmark_triangle_fill,
              color: AppColors.dataViz3, // Amber for warning/risk
            ),
            const SizedBox(height: 24),

            // --- Section 2: Training & Documentation Status ---
            _buildSectionHeader(context, 'Training & Certification Status'),
            _buildTrainingStatusCard(context),
            const SizedBox(height: 24),

            // --- Section 3: Key Documentation ---
            _buildSectionHeader(context, 'Key Safety Documentation'),
            _buildDocTile(
              context,
              title: 'Company HSE Policy 2025',
              subtitle: 'Review the latest Health, Safety, and Environment document.',
              icon: CupertinoIcons.doc_text_fill,
            ),
            _buildDocTile(
              context,
              title: 'Emergency Contact Procedures',
              subtitle: 'Quick access to emergency numbers and protocols.',
              icon: CupertinoIcons.phone_fill,
              color: AppColors.danger,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: const Color(0xFF333333)),
      ),
    );
  }

  Widget _buildChecklistTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.secondaryTextHint),
        ),
        trailing: const Icon(CupertinoIcons.chevron_forward),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ComplianceFormPage(title: title)));
        },
      ),
    );
  }

  Widget _buildDocTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    Color? color,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Icon(icon, color: color ?? AppColors.info, size: 30),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15)),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        trailing: const Icon(CupertinoIcons.square_arrow_down, size: 20),
        onTap: () {
          // Action to view/download document
        },
      ),
    );
  }

  Widget _buildTrainingStatusCard(BuildContext context) {
    // Example Status Data
    const int coursesDue = 1;
    const String nextCourse = 'Fire Extinguisher Use (Due Dec 31)';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.dataViz4.withOpacity(0.1), // Light green background
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.dataViz4, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Icon(CupertinoIcons.checkmark_seal_fill, color: AppColors.dataViz4),
              const SizedBox(width: 8),
              Text(
                'Compliance Status: Compliant',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, color: AppColors.dataViz4),
              ),
            ],
          ),
           Divider(color: AppColors.secondaryTextHint, height: 20),
          Text('Courses Due: $coursesDue', style: Theme.of(context).textTheme.bodyLarge),
          Text('Next Requirement: $nextCourse', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                // Navigate to training module
              },
              icon: const Icon(CupertinoIcons.book_fill, size: 18, color: AppColors.info),
              label: Text('VIEW TRAINING MODULES', style: TextStyle(color: AppColors.info)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.info),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
