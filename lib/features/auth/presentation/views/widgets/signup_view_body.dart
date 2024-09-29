import 'package:flutter/material.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/custom_button.dart';
import 'package:fruity/core/components/custom_text_form_field.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/auth/presentation/views/widgets/account_action_text.dart';
import 'package:fruity/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';
import 'package:fruity/generated/l10n.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
                hintText: S.of(context).signupName,
                keyboardType: TextInputType.name),
            const SizedBox(height: 16),
            CustomTextFormField(
                hintText: S.of(context).signupEmail,
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 16),
            CustomTextFormField(
              suffixIcon: const Icon(Icons.remove_red_eye),
              hintText: S.of(context).signupPassword,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            TermsAndConditions(onChanged: (value) {}),
            const SizedBox(height: 30),
            CustomButton(
              textStyle:
                  AppTextStyles.cairoBold16.copyWith(color: Colors.white),
              text: S.of(context).signupButton,
              onPressed: () {},
            ),
            const SizedBox(height: 26),
            AccountActionText(
              actionText: S.of(context).signupHaveAccount2,
              textBeforeAction: S.of(context).signupHaveAccount1,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
