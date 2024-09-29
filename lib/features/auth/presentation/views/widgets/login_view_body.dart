import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/custom_button.dart';
import 'package:fruity/core/components/custom_text_form_field.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/auth/presentation/views/signup_view.dart';
import 'package:fruity/features/auth/presentation/views/widgets/account_action_text.dart';
import 'package:fruity/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruity/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruity/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: S.of(context).loginEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: S.of(context).loginPassword,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: const Icon(Icons.remove_red_eye),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  S.of(context).loginForgotPassword,
                  style: AppTextStyles.cairoSemiBold13.copyWith(
                    color: AppColors.primaryLightColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33),
            CustomButton(
              text: S.of(context).loginAppBar,
              textStyle: AppTextStyles.cairoBold16,
              onPressed: () {},
            ),
            const SizedBox(height: 33),
            AccountActionText(
              textBeforeAction: S.of(context).loginCreateAccount1,
              actionText: S.of(context).loginCreateAccount2,
              onTap: () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
            ),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 21),
            SocialLoginButton(
              title: S.of(context).loginSignGoogle,
              image: SvgPicture.asset(
                Assets.imagesGoogleLogo,
              ),
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              title: S.of(context).loginSignApple,
              image: SvgPicture.asset(
                Assets.imagesAppleLogo,
              ),
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              title: S.of(context).loginSignFacebook,
              image: SvgPicture.asset(
                Assets.imagesFacebookLogo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
