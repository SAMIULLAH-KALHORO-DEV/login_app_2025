import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

// --- Placeholder/Shim for missing project classes (AppColors) ---

// --- End Shims ---

class MyPerformancePage extends StatelessWidget {
  const MyPerformancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('My Performance'),
        backgroundColor: AppColors.surfaceBackground,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionHeader(context, 'Monthly Key Metrics (November)'),
            _buildMetricsGrid(context),
            const SizedBox(height: 24),

            _buildSectionHeader(context, 'Quality & Feedback'),
            _buildQualityCard(context),
            const SizedBox(height: 24),

            _buildSectionHeader(context, 'Job Volume Overview'),
            _buildVolumeChartPlaceholder(context),
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

  Widget _buildMetricTile(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.secondaryTextHint),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildMetricTile(
          context,
          title: 'On-Time Rate',
          value: '98%',
          icon: CupertinoIcons.timer,
          color: AppColors.dataViz4,
        ),
        _buildMetricTile(
          context,
          title: 'Jobs Completed',
          value: '52',
          icon: CupertinoIcons.hammer_fill,
          color: AppColors.dataViz1,
        ),
        _buildMetricTile(
          context,
          title: 'First-Time Fix',
          value: '91%',
          icon: CupertinoIcons.wrench_fill,
          color: AppColors.info,
        ),
        _buildMetricTile(
          context,
          title: 'Unplanned Leave',
          value: '0 Days',
          icon: CupertinoIcons.person_badge_minus_fill,
          color: AppColors.dataViz3,
        ),
      ],
    );
  }

  Widget _buildQualityCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Average Quality Score',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '4.9/5.0',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.copyWith(color: AppColors.dataViz4, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.98, // Representing 98%
              backgroundColor: AppColors.surfaceBackground,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.dataViz4),
              minHeight: 8,
            ),
            const SizedBox(height: 12),
            Text(
              'Based on client satisfaction surveys and supervisor checks.',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.secondaryTextHint),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.chevron_forward, size: 16),
              label: const Text('VIEW DETAILED REPORTS'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVolumeChartPlaceholder(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.surfaceBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.secondaryTextHint.withOpacity(0.3)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.graph_square, size: 40, color: AppColors.secondaryTextHint),
            const SizedBox(height: 8),
            Text('Monthly Job Volume Chart Placeholder', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
