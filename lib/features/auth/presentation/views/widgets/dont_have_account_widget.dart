import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/auth/presentation/views/signup_view.dart';
import 'package:fruity/generated/l10n.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: S.of(context).loginCreateAccount1,
            style: AppTextStyles.cairoSemiBold16.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
          const WidgetSpan(
            child: SizedBox(
              width: 5,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushNamed(SignupView.routeName);
              },
            text: S.of(context).loginCreateAccount2,
            style: AppTextStyles.cairoSemiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
