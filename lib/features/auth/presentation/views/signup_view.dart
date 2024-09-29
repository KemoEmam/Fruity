import 'package:flutter/material.dart';
import 'package:fruity/core/components/custom_app_bar.dart';
import 'package:fruity/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:fruity/generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, S.of(context).signupAppBar),
      body: const SignupViewBody(),
    );
  }
}
