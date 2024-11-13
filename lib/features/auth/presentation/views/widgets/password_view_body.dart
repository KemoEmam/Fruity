import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/custom_button.dart';
import 'package:fruity/core/components/custom_text_form_field.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/auth/presentation/manager/password_cubit/password_cubit.dart';
import 'package:fruity/generated/l10n.dart';

class PasswordViewBody extends StatefulWidget {
  const PasswordViewBody({super.key});

  @override
  State<PasswordViewBody> createState() => _PasswordViewBodyState();
}

class _PasswordViewBodyState extends State<PasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              S.current.passwordViewBody,
              style: AppTextStyles.cairoSemiBold16.copyWith(
                color: const Color(0xff616A6B),
              ),
            ),
            const SizedBox(height: 31),
            CustomTextFormField(
              onSaved: (value) {
                email = value!.trim();
              },
              hintText: S.of(context).loginEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: S.of(context).passwordButton,
              textStyle: AppTextStyles.cairoBold16,
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<PasswordCubit>().resetPassword(email);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
