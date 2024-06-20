import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import 'network_cached_image.dart';

AppBar profileAppBar() {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading:  Padding(
      padding:  EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: NetworkCatchedImage(
          url: '',
        ),
      ),
    ),
    title: Column(
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
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined))
    ],
  );
}