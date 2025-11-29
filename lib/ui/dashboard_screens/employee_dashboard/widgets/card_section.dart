import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

/// Reusable Priority Card Row widget for dashboard sections
class PriorityCardRow extends StatelessWidget {
  const PriorityCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile / small screen layout (column)
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _NextTaskCard(isMobile: true),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.2, // makes width = height
                      child: _ProgressCard(),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.2, // same as above
                      child: _AlertsCard(),
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        // Larger screen layout (row)
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(flex: 3, child: _NextTaskCard()),
            SizedBox(width: 16),
            Expanded(flex: 2, child: _ProgressCard()),
            SizedBox(width: 16),
            Expanded(flex: 2, child: _AlertsCard()),
          ],
        );
      },
    );
  }
}

class _NextTaskCard extends StatelessWidget {
  final bool isMobile;
  const _NextTaskCard({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    final taskStatusColor = AppColors.dataViz1;

    Widget cardContent = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: taskStatusColor.withOpacity(0.3), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Next Work Order',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.secondaryTextHint),
            ),
            const SizedBox(height: 4),
            Text(
              'HVAC Unit Check-Up #401',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primaryText),
            ),
            const SizedBox(height: 8),
            Text('Client: Atlas Group Industries', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('Location: Tower B, Floor 12', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                label: const Text('START JOB'),
              ),
            ),
          ],
        ),
      ),
    );

    return isMobile ? cardContent : cardContent;
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard();

  @override
  Widget build(BuildContext context) {
    const double completionRate = 6 / 8;
    const int completed = 6;
    const int total = 8;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Progress',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.secondaryTextHint),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: completionRate,
                    strokeWidth: 4,
                    color: AppColors.baseAccentShadows,
                    backgroundColor: AppColors.baseAccentShadows,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.dataViz3),
                  ),
                  Text(
                    '${(completionRate * 100).toInt()}%',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.dataViz4, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$completed / $total Jobs',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertsCard extends StatelessWidget {
  const _AlertsCard();

  @override
  Widget build(BuildContext context) {
    const alertCount = 2;

    return Card(
      // color: AppColors.primaryInteraction.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: BorderSide(color: AppColors.primaryInteraction, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Urgent Alerts',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.primaryInteraction),
            ),
            const SizedBox(height: 10),
            Icon(Icons.warning_amber_rounded, size: 40, color: AppColors.primaryInteraction),
            const SizedBox(height: 10),
            Text(
              '$alertCount Pending',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppColors.primaryInteraction, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
