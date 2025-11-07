import 'package:flutter/material.dart';

class RoleBasedGrid extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = [
    {'icon': Icons.assignment, 'title': 'Surveys'},
    {'icon': Icons.bar_chart, 'title': 'Reports'},
    {'icon': Icons.schedule, 'title': 'Schedule'},
    {'icon': Icons.analytics, 'title': 'Analytics'},
    {'icon': Icons.notifications, 'title': 'Notifications'},
    {'icon': Icons.person, 'title': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 icons per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9, // Adjust height for icon + title
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0x23F44336), borderRadius: BorderRadius.circular(12)),
                child: Icon(item['icon'], size: 40, color: Colors.red.shade900),
              ),
              SizedBox(height: 8),
              Text(item['title'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          );
        },
      ),
    );
  }
}
