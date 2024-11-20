import 'package:flutter/material.dart';
import 'package:fruity/core/components/custom_button.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/generated/l10n.dart';

class FeaturedButton extends StatelessWidget {
  const FeaturedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 32,
      child: CustomButton(
        textColor: AppColors.primaryColor,
        buttonColor: Colors.white,
        borderRadius: 4,
        text: S.of(context).homeFeaturedButton,
        textStyle: AppTextStyles.cairoBold13,
        onPressed: () {},
      ),
    );
  }
}
