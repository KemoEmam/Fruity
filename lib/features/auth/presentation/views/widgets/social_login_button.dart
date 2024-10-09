import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';

class SocialSigninButton extends StatelessWidget {
  const SocialSigninButton(
      {super.key, required this.title, required this.image});

  final String title;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffDDDFDF), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: ListTile(
          visualDensity:
              const VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: image,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.cairoSemiBold16,
          ),
        ),
      ),
    );
  }
}
