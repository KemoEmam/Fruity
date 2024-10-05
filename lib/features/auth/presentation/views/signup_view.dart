import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/core/components/custom_app_bar.dart';
import 'package:fruity/core/services/service_locator.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';
import 'package:fruity/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruity/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:fruity/generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, S.of(context).signupAppBar),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
