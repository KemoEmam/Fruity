import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.cairoRegular16.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      subtitle: const Text(
        'أحمد مصطفي',
        style: AppTextStyles.cairoBold16,
      ),
      leading: CircleAvatar(
        child: Image.asset(AppImages.imagesAvatarHome),
      ),
      trailing: CircleAvatar(
        backgroundColor: const Color(0xFFEEF8ED),
        child: SvgPicture.asset(AppImages.imagesNotification),
      ),
    );
  }
}
