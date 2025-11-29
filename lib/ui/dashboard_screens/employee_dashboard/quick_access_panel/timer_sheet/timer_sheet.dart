import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

// --- Placeholder/Shim for missing project classes (AppColors) ---

// --- End Shims ---

class TimesheetPage extends StatelessWidget {
   TimesheetPage({super.key});

  final List<Map<String, dynamic>> weeklyEntries =  [
    {'day': 'Monday', 'hours': 8.5, 'status': 'Approved', 'color': AppColors.dataViz4},
    {'day': 'Tuesday', 'hours': 8.0, 'status': 'Approved', 'color': AppColors.dataViz4},
    {'day': 'Wednesday', 'hours': 9.0, 'status': 'Pending', 'color': AppColors.dataViz3},
    {'day': 'Thursday', 'hours': 8.5, 'status': 'Pending', 'color': AppColors.dataViz3},
    {'day': 'Friday', 'hours': 4.0, 'status': 'Draft', 'color': AppColors.dataViz1},
  ];

  @override
  Widget build(BuildContext context) {
    final double totalHours = weeklyEntries.fold(0.0, (sum, item) => sum + (item['hours'] as double));

    return Scaffold(
      appBar: CupertinoNavigationBar(middle: const Text('Timesheet'), backgroundColor: AppColors.surfaceBackground),
      body: Column(
        children: [
          _buildSummaryCard(context, totalHours),
          _buildWeekSelector(context),
          Expanded(
            child: ListView.builder(
              itemCount: weeklyEntries.length,
              itemBuilder: (context, index) {
                return _buildTimeEntryTile(context, weeklyEntries[index]);
              },
            ),
          ),
          _buildActionButton(context),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, double totalHours) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.dataViz1.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.dataViz1, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Hours This Week:',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            '${totalHours.toStringAsFixed(1)} hrs',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: AppColors.dataViz1),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekSelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Icon(CupertinoIcons.chevron_left, color: AppColors.secondaryTextHint),
          Text(
            'Week of Nov 25 - Dec 1, 2025',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
           Icon(CupertinoIcons.chevron_right, color: AppColors.secondaryTextHint),
        ],
      ),
    );
  }

  Widget _buildTimeEntryTile(BuildContext context, Map<String, dynamic> entry) {
    final statusColor = entry['color'] as Color;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        leading: Icon(CupertinoIcons.calendar_circle, color: statusColor),
        title: Text(entry['day'] as String, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text('${entry['hours']} hours logged', style: Theme.of(context).textTheme.bodyMedium),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
              child: Text(
                entry['status'] as String,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: statusColor, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(CupertinoIcons.pencil, size: 20),
          ],
        ),
        onTap: () {
          // Navigate to edit time entry
        },
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    // Logic to determine button label/color based on timesheet status
    const bool isReadyToSubmit = true;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, -3)),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: isReadyToSubmit
              ? () {
                  // Submit Timesheet Action
                }
              : null,
          icon: const Icon(CupertinoIcons.doc_checkmark_fill, size: 20),
          label: const Text('SUBMIT TIMESHEET FOR APPROVAL'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.dataViz4,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledBackgroundColor: AppColors.secondaryTextHint.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
