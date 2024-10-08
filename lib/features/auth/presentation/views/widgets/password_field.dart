import 'package:flutter/material.dart';
import '../../../../../core/components/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: IconButton(
        icon: obscureText
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
      hintText: S.of(context).signupPassword,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
