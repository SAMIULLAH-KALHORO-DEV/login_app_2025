import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/text_theme.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: ContainerTheme().ContainerTheme1,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: ColorsTheme().backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(CupertinoIcons.person),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kashif', style: TextsTheme().heading1sytle),
                      Text('Admin', style: TextsTheme().heading3sytle),
                    ],
                  ),
                ],
              ),

              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(color: const Color(0x0F000000), borderRadius: BorderRadius.circular(30)),
                child: Icon(CupertinoIcons.bell, size: 30, color: ColorsTheme().iconColor),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(CupertinoIcons.search),

              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
