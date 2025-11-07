import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/text_theme.dart';


class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: const Color(0x23F44336), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kashif', style: ThemeText().heading1sytle),
                  Text('Admin', style: ThemeText().heading3sytle),
                ],
              ),
            ],
          ),

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: const Color(0x0F000000), borderRadius: BorderRadius.circular(30)),
            child: Icon(CupertinoIcons.bell, size: 30, color: const Color(0x9D000000)),
          ),
        ],
      ),
    );
  }
}
