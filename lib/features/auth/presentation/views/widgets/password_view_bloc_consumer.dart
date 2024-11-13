import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/core/components/show_snack_bar.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/features/auth/presentation/manager/password_cubit/password_cubit.dart';
import 'package:fruity/features/auth/presentation/views/widgets/password_view_body.dart';
import 'package:fruity/generated/l10n.dart';

class PasswordViewBlocConsumer extends StatelessWidget {
  const PasswordViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordCubit, PasswordState>(
      listener: (context, state) {
        if (state is PasswordSuccess) {
          showSnackBar(
            context: context,
            title: S.of(context).successTitle,
            message: S.of(context).passwordSendLink,
            backgroundColor: AppColors.primaryColor,
            icon: Icons.check,
          );
        } else if (state is PasswordFailure) {
          showSnackBar(
            context: context,
            title: S.of(context).errorTitle,
            message: state.message,
            backgroundColor: Colors.redAccent,
            icon: Icons.error,
          );
        }
      },
      builder: (context, state) => const PasswordViewBody(),
    );
  }
}
