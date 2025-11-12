import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      onTap: (value) {
      },

      items: [
        BottomNavigationBarItem(
          
          icon: Icon(CupertinoIcons.add, size: 30, color: ColorsTheme().iconColor),
          label: 'Add Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chart_bar_alt_fill, size: 30, color: ColorsTheme().iconColor),
          label: 'View Stats',
        ),

        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.text_alignleft, size: 30, color: ColorsTheme().iconColor),
          label: 'Assign Task',
        ),
      ],
    );
  }
}
