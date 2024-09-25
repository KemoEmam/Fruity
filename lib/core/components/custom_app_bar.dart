import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios_new_sharp,
        color: Colors.black,
      ),
    ),
    title: Text(
      title,
      style: AppTextStyles.cairoBold19.copyWith(color: Colors.black),
    ),
  );
}
