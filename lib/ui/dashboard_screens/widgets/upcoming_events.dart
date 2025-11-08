import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/Theme.dart';
import 'package:login_app_2025/constants/app_assets.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Stack(
        children: [
          ContainerTheme2(),
          Container(
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('10June ', style: TextsTheme().heading1sytle),
                Text(
                  '10 is the company 20th aniversiry which is very important to all company members',
                  style: TextsTheme().heading3sytle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
