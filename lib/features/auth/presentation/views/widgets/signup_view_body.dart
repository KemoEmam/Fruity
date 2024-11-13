import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/custom_button.dart';
import 'package:fruity/core/components/custom_text_form_field.dart';
import 'package:fruity/core/components/show_snack_bar.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruity/features/auth/presentation/views/widgets/account_action_text.dart';
import 'package:fruity/features/auth/presentation/views/widgets/password_field.dart';
import 'package:fruity/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';
import 'package:fruity/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!.trim();
                  },
                  hintText: S.of(context).signupName,
                  keyboardType: TextInputType.name),
              const SizedBox(height: 16),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!.trim();
                  },
                  hintText: S.of(context).signupEmail,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              PasswordField(
                hintText: S.of(context).signupPassword,
                onSaved: (value) {
                  password = value!.trim();
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                textStyle:
                    AppTextStyles.cairoBold16.copyWith(color: Colors.white),
                text: S.of(context).signupButton,
                onPressed: () {
                  signupValidation(context);
                },
              ),
              const SizedBox(height: 26),
              AccountActionText(
                actionText: S.of(context).signupHaveAccount2,
                textBeforeAction: S.of(context).signupHaveAccount1,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signupValidation(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (isTermsAccepted) {
        context
            .read<SignupCubit>()
            .createUserWithEmailAndPassword(email, password, name);
      } else {
        showSnackBar(
          title: S.of(context).errorTitle,
          backgroundColor: Colors.redAccent,
          context: context,
          message: S.of(context).signupErrorTerms,
        );
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
