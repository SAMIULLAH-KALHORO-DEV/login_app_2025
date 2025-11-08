import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/Theme.dart';

class RoleBasedGrid extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = [
    {'icon': CupertinoIcons.bag_badge_plus, 'title': 'Surveys'},
    {'icon': Icons.stacked_bar_chart, 'title': 'Reports'},
    {'icon': CupertinoIcons.time, 'title': 'Schedule'},
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
                decoration: ContainerTheme().containerTheme1,
                child: Icon(item['icon'], size: 40, color: ColorsTheme().iconColor),
              ),
              SizedBox(height: 8),
              Text(item['title'], style: TextsTheme().heading3sytle),
            ],
          );
        },
      ),
    );
  }
}


  //  Container(
  //               padding: EdgeInsets.all(16),
  //               decoration: ContainerTheme().containerTheme1,
  //               child: Icon(item['icon'], size: 40, color: ColorsTheme().iconColor),
  //             ),
  //             SizedBox(height: 8),
  //             Text(item['title'], style: TextsTheme().heading3sytle),
  //           ],
  //         );