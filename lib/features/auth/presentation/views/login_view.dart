import 'package:flutter/material.dart';
import 'package:fruity/core/components/custom_app_bar.dart';
import 'package:fruity/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruity/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, S.of(context).loginAppBar,
          showBackButton: false),
      body: const LoginViewBody(),
    );
  }
}
