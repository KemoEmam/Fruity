import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/core/components/custom_progress_hud.dart';
import 'package:fruity/core/components/show_snack_bar.dart';
import 'package:fruity/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruity/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruity/features/home/presentation/views/home_view.dart';
import 'package:fruity/generated/l10n.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.of(context).pushReplacementNamed(HomeView.routeName);
        }

        if (state is SigninFailure) {
          showSnackBar(
            context: context,
            title: S.of(context).errorTitle,
            message: state.message,
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
