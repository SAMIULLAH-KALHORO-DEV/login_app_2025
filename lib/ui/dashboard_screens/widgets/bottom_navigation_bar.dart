import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,

      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bell, size: 30, color: const Color(0x9D000000)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bell, size: 30, color: const Color(0x9D000000)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bell, size: 30, color: const Color(0x9D000000)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bell, size: 30, color: const Color(0x9D000000)),
          label: '',
        ),
      ],
    );
  }
}
