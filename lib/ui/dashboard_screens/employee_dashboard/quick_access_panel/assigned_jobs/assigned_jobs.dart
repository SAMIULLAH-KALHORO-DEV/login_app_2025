import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

// --- Placeholder/Shim for missing project classes (AppColors) ---
// Note: In a real project, this would be imported from a constants file.

// --- End Shims ---

class AssignedJobs extends StatelessWidget {
  AssignedJobs({super.key});
  

  final List<Map<String, dynamic>> dailyTasks = [
    {
      'id': 'WO-401',
      'title': 'HVAC Unit Check-Up',
      'client': 'Atlas Group Industries',
      'location': 'Tower B, Floor 12',
      'time': '9:00 AM - 11:00 AM',
      'status': 'In Progress',
      'color': AppColors.dataViz1, // Blue
    },
    {
      'id': 'WO-402',
      'title': 'Pest Control (Fumigation)',
      'client': 'Samba Bank Limited',
      'location': 'Ground Floor Vaults',
      'time': '11:30 AM - 1:00 PM',
      'status': 'Pending',
      'color': AppColors.dataViz3, // Amber
    },
    {
      'id': 'WO-403',
      'title': 'Restroom Deep Cleaning',
      'client': 'Telenor Microfinance Bank',
      'location': 'Head Office, All Floors',
      'time': '2:00 PM - 4:00 PM',
      'status': 'Completed',
      'color': AppColors.dataViz4, // Amber
    },
    {
      'id': 'WO-399',
      'title': 'Window Cleaning (External)',
      'client': 'Pakistan Stock Exchange',
      'location': 'Building Facade',
      'time': '4:30 PM - 6:00 PM',
      'status': 'Completed',
      'color': AppColors.dataViz4, // Green
    },
  ];

  final dateTime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        // --- RENAMED: 'Daily Roster' to 'My Workday' ---
        middle: const Text('My Workday'),
        trailing: IconButton(
          icon: const Icon(CupertinoIcons.calendar_today, size: 24),
          onPressed: () {
            // Action to select a different date
          },
        ),
        backgroundColor: AppColors.surfaceBackground,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // --- RENAMED: 'Tasks for Today' instead of 'Daily Roster' ---
                  'Tasks for Today: ${dateTime.split(' ')[0]}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${dailyTasks.where((t) => t['status'] != 'Completed').length} Pending',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: AppColors.primaryInteraction, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: dailyTasks.length,
              itemBuilder: (context, index) {
                final task = dailyTasks[index];
                return _buildTaskCard(context, task);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context, Map<String, dynamic> task) {
    final isCompleted = task['status'] == 'Completed';
    final statusColor = task['color'] as Color;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: statusColor.withOpacity(0.5), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task['id'] as String,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.secondaryTextHint),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    task['status'] as String,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: statusColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(task['title'] as String, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18)),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(CupertinoIcons.clock, size: 16, color: AppColors.secondaryTextHint),
                const SizedBox(width: 4),
                Text(task['time'] as String, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(CupertinoIcons.location, size: 16, color: AppColors.secondaryTextHint),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${task['client']} / ${task['location']}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (!isCompleted)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Start/Continue Job Action
                  },
                  icon: const Icon(CupertinoIcons.play_fill, size: 18),
                  label: Text(task['status'] == 'In Progress' ? 'CONTINUE JOB' : 'START JOB'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryInteraction,
                    foregroundColor: Colors.white,
                  ),
                ),
              )
            else
              Center(
                child: Text(
                  'Task Completed',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.dataViz4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
