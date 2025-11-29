import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

// --- Placeholder/Shim for missing project classes (AppColors) ---

// --- End Shims ---

class AnnouncementsPage extends StatelessWidget {
   AnnouncementsPage({super.key});

  final List<Map<String, dynamic>> companyAnnouncements =  [
    {
      'type': 'Safety Alert',
      'title': 'Mandatory Review: New Ladder Safety Protocol',
      'date': 'November 28, 2025',
      'isNew': true,
      'isUrgent': true,
      'icon': CupertinoIcons.exclamationmark_shield_fill,
      'color': AppColors.primaryInteraction, // Red for Urgent Safety
    },
    {
      'type': 'HR Policy',
      'title': 'Updated Timesheet Submission Deadline',
      'date': 'November 25, 2025',
      'isNew': false,
      'isUrgent': false,
      'icon': CupertinoIcons.doc_checkmark_fill,
      'color': AppColors.dataViz1, // Blue for Policy
    },
    {
      'type': 'General Update',
      'title': 'Q4 Team Dinner Venue Confirmation',
      'date': 'November 22, 2025',
      'isNew': false,
      'isUrgent': false,
      'icon': CupertinoIcons.bell_fill,
      'color': AppColors.dataViz4, // Green for Info
    },
    {
      'type': 'IT Notice',
      'title': 'Scheduled Downtime for Inventory System',
      'date': 'November 18, 2025',
      'isNew': false,
      'isUrgent': false,
      'icon': CupertinoIcons.desktopcomputer,
      'color': AppColors.secondaryTextHint, // Gray for Notice
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(middle: const Text('Announcements'), backgroundColor: AppColors.surfaceBackground),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              'Company Updates and Safety Alerts',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: companyAnnouncements.length,
              itemBuilder: (context, index) {
                final announcement = companyAnnouncements[index];
                return _buildAnnouncementCard(context, announcement);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(BuildContext context, Map<String, dynamic> announcement) {
    final statusColor = announcement['color'] as Color;
    final isNew = announcement['isNew'] as bool;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        // Highlight urgent items with a strong border
        side: BorderSide(
          color: (announcement['isUrgent'] as bool) ? AppColors.primaryInteraction : Colors.transparent,
          width: (announcement['isUrgent'] as bool) ? 2.0 : 0.0,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12.0),
        leading: Icon(announcement['icon'] as IconData, color: statusColor, size: 30),
        title: Row(
          children: [
            Expanded(
              child: Text(
                announcement['title'] as String,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isNew)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.dataViz3, // Amber background for 'New' tag
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'NEW',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${announcement['type']} • ${announcement['date']}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.secondaryTextHint),
            ),
          ],
        ),
        trailing:  Icon(CupertinoIcons.chevron_forward, color: AppColors.secondaryTextHint),
        onTap: () {
          // Navigation to the full announcement details page
        },
      ),
    );
  }
}
