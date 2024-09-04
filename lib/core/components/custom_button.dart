import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.borderRadius = 16,
    this.textStyle,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: textStyle ?? TextStyle(fontSize: fontSize),
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle?.copyWith(color: textColor) ??
              TextStyle(
                  fontSize: fontSize ?? 16,
                  color: textColor,
                  fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
