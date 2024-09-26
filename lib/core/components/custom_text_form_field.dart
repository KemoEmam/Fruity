import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  // final String labelText;
  // final TextStyle? labelTextStyle;
  final String hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;

  const CustomTextFormField({
    super.key,
    // required this.labelText,
    // this.labelTextStyle,
    required this.hintText,
    this.hintTextStyle,
    this.controller,
    this.validator,
    required this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.grey,
    this.enabledBorderColor = const Color(0xffeff2f2),
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        // labelText: labelText,//label text instead of hint text
        // labelStyle: labelTextStyle ??
        // AppTextStyles.cairoBold13.copyWith(color: const Color(0xFF949D9E)),
        hintText: hintText,
        hintStyle: hintTextStyle ??
            AppTextStyles.cairoBold13.copyWith(color: const Color(0xFF949D9E)),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor ?? Colors.grey,
        border: _borderBuilder(borderColor),
        focusedBorder: _borderBuilder(focusedBorderColor),
        enabledBorder: _borderBuilder(enabledBorderColor),
      ),
    );
  }

  OutlineInputBorder _borderBuilder(Color color, {double width = 1.1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
