import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context,
  String title, {
  Widget? leading,
  Widget? trailing,
  bool showBackButton = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: leading ??
        (showBackButton
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.black,
                ),
              )
            : null),
    title: Text(
      title,
      style: AppTextStyles.cairoBold19.copyWith(color: Colors.black),
    ),
    actions: [
      if (trailing != null)
        trailing, // Include custom trailing widget if provided
    ],
  );
}
