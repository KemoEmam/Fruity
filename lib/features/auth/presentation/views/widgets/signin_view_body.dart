import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/custom_button.dart';
import 'package:fruity/core/components/custom_text_form_field.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruity/features/auth/presentation/views/password_view.dart';
import 'package:fruity/features/auth/presentation/views/signup_view.dart';
import 'package:fruity/features/auth/presentation/views/widgets/account_action_text.dart';
import 'package:fruity/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruity/features/auth/presentation/views/widgets/password_field.dart';
import 'package:fruity/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruity/generated/l10n.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!.trim();
                },
                hintText: S.of(context).loginEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                hintText: S.of(context).loginPassword,
                onSaved: (value) {
                  password = value!.trim();
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PasswordView.routeName);
                    },
                    child: Text(
                      S.of(context).loginForgotPassword,
                      style: AppTextStyles.cairoSemiBold13.copyWith(
                        color: AppColors.primaryLightColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomButton(
                text: S.of(context).loginAppBar,
                textStyle: AppTextStyles.cairoBold16,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    context
                        .read<SigninCubit>()
                        .signInWithEmailAndPassword(email, password);
                  }
                },
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
              SocialSigninButton(
                title: S.of(context).loginSignGoogle,
                image: SvgPicture.asset(
                  AppImages.imagesGoogleLogo,
                ),
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 16),
              SocialSigninButton(
                title: S.of(context).loginSignApple,
                image: SvgPicture.asset(
                  AppImages.imagesAppleLogo,
                ),
                onPressed: () {
                  context.read<SigninCubit>().signInWithApple();
                },
              ),
              const SizedBox(height: 16),
              SocialSigninButton(
                title: S.of(context).loginSignFacebook,
                image: SvgPicture.asset(
                  AppImages.imagesFacebookLogo,
                ),
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
