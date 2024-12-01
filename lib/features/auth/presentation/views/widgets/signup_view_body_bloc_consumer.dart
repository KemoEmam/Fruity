import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/core/components/custom_progress_hud.dart';
import 'package:fruity/core/router/routes.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruity/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:fruity/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/components/show_snack_bar.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          showSnackBar(
            context: context,
            title: S.of(context).successTitle,
            message: S.of(context).authSignupSuccess,
            backgroundColor: AppColors.primaryColor,
            icon: Icons.check,
          );
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Future.delayed(
              const Duration(seconds: 2), // Delay for 3 seconds
              () {
                if (context.mounted) {
                  // Add mounted check to ensure context is valid
                  //  GoRouter.of(context).pushReplacementNamed(SigninView.routeName);
                  context.go(Routes.signin);
                }
              },
            );
          });
        } else if (state is SignupFailure) {
          showSnackBar(
            context: context,
            title: S.of(context).errorTitle,
            message: state.message,
            backgroundColor: Colors.redAccent,
            icon: Icons.error, // Error icon
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
