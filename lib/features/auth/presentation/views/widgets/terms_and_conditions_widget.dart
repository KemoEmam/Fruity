import 'package:flutter/material.dart';
import 'package:fruity/core/components/directional_widget.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  final String labelFirstPart;
  final String labelSecondPart;
  final TextStyle? firstPartStyle;
  final TextStyle? secondPartStyle;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color checkColor;
  final Color backgroundColor;
  final double checkboxSize;

  const TermsAndConditions({
    super.key,
    required this.onChanged,
    this.labelFirstPart = 'من خلال إنشاء حساب ، فإنك توافق علي ',
    this.labelSecondPart = 'الشروط والأحكام الخاصة بنا',
    this.firstPartStyle,
    this.secondPartStyle,
    this.initialValue = false,
    this.activeColor = Colors.transparent,
    this.checkColor = Colors.white,
    this.backgroundColor = AppColors.primaryColor, // Default color
    this.checkboxSize = 24.0,
  });

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  void _toggleCheckbox(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _toggleCheckbox(!_isChecked),
          child: Container(
            width: widget.checkboxSize,
            height: widget.checkboxSize,
            decoration: BoxDecoration(
              color: _isChecked
                  ? widget.backgroundColor
                  : Colors.transparent, // Background color
              border: Border.all(
                color: _isChecked ? widget.activeColor : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: _isChecked
                ? Icon(
                    Icons.check,
                    size: widget.checkboxSize - 8,
                    color: widget.checkColor,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: DirectionalWidget(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsets.only(
              left: isRTL ? 0 : 16.0, // Adjust padding based on locale
              right: isRTL ? 16.0 : 0,
            ),
            child: GestureDetector(
              onTap: () => _toggleCheckbox(!_isChecked),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.labelFirstPart,
                      style: widget.firstPartStyle ??
                          AppTextStyles.cairoBold13.copyWith(
                            color: const Color(0xff949D9E),
                          ),
                    ),
                    TextSpan(
                      text: widget.labelSecondPart,
                      style: widget.secondPartStyle ??
                          AppTextStyles.cairoBold13.copyWith(
                            color: AppColors.primaryLightColor,
                          ),
                    ),
                  ],
                ),
                textDirection: isRTL
                    ? TextDirection.rtl
                    : TextDirection
                        .ltr, // Ensure proper alignment for each locale
              ),
            ),
          ),
        ),
      ],
    );
  }
}
