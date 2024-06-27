import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screen/update_profile_screen.dart';

import '../utility/app_colors.dart';
import 'network_cached_image.dart';

AppBar profileAppBar(context, [bool fromUpdateProfile = false]) {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: GestureDetector(
        onTap: () {
          if (fromUpdateProfile) {
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UpdateProfileScreen(),
            ),
          );
        },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          child: NetworkCatchedImage(
            url: '',
          ),
        ),
      ),
    ),
    title: GestureDetector(
      onTap: () {
        if (fromUpdateProfile) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdateProfileScreen(),
          ),
        );
      },
      child: const Column(
        children: [
          Text(
            'Dummy Name',
            style: TextStyle(fontSize: 16, color: AppColors.white),
          ),
          Text(
            'dummy@gmail.com',
            style: TextStyle(
                fontSize: 12,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.logout_outlined))
    ],
  );
}
