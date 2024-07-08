import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/controller/auth_controller.dart';
import 'package:task_manager_app/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager_app/ui/screen/update_profile_screen.dart';

import '../utility/app_colors.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.memory(
              base64Decode(AuthController.userData?.photo ?? ''),
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AuthController.userData?.fullName ?? '',
            style: const TextStyle(fontSize: 16, color: AppColors.white),
          ),
          Text(
            AuthController.userData?.email ?? '',
            style: const TextStyle(
                fontSize: 12,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            await AuthController.clearAllData();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
                (route) => false);
          },
          icon: const Icon(Icons.logout_outlined))
    ],
  );
}
