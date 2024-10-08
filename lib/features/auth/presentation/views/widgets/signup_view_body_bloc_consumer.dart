import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruity/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruity/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:fruity/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/components/show_snack_bar.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
        } else if (state is SignupFailure) {
          showSnackBar(
            context: context,
            title: S.of(context).signupErrorTitle,
            message: state.message,
            backgroundColor: Colors.redAccent,
            icon: Icons.error, // Error icon
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
