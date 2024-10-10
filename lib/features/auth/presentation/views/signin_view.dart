import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/core/components/custom_app_bar.dart';
import 'package:fruity/core/services/service_locator.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';
import 'package:fruity/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruity/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';
import 'package:fruity/generated/l10n.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const String routeName = 'signin';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          S.of(context).loginAppBar,
          showBackButton: false,
        ),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
