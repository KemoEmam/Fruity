import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/core/components/custom_app_bar.dart';
import 'package:fruity/core/services/service_locator.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';
import 'package:fruity/features/auth/presentation/manager/password_cubit/password_cubit.dart';
import 'package:fruity/features/auth/presentation/views/widgets/password_view_bloc_consumer.dart';
import 'package:fruity/generated/l10n.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  static const String routeName = 'password';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, S.of(context).passwordAppBar),
        body: const PasswordViewBlocConsumer(),
      ),
    );
  }
}
