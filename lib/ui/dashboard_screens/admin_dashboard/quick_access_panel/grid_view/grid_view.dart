import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

class ManagementQuickLinksGrid extends StatelessWidget {
  ManagementQuickLinksGrid({super.key});

  final List<Map<String, dynamic>> gridItems = [
    {'icon': CupertinoIcons.chart_bar_square_fill, 'title': 'Performance Metrics', 'color': AppColors.dataViz1},
    {'icon': CupertinoIcons.doc_person_fill, 'title': 'Training Records', 'color': AppColors.dataViz4},
    {'icon': CupertinoIcons.hand_draw_fill, 'title': 'Leave Requests', 'color': AppColors.dataViz3},
    {'icon': CupertinoIcons.money_dollar_circle_fill, 'title': 'Salary Data', 'color': AppColors.secondaryTextHint},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Team Data Access',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 items per row
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8, // Adjust height for icon and text
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            final item = gridItems[index];
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                // Navigate to the respective management section
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: item['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(item['icon'] as IconData, size: 28, color: item['color'] as Color),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['title'] as String,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600, color: item['color'] as Color),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
