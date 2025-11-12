import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  const BottomNavBar({super.key,
    required this.currentIndex,
    required this.onItemTapped
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: ColorsTheme().backgroundColor,
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,

      items: [
        BottomNavigationBarItem(
          
          icon: Icon(CupertinoIcons.home, size: 30, color: ColorsTheme().iconColor),
          label: 'Home',
          
        ),
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
