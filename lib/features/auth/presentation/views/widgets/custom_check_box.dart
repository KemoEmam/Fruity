import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color checkColor;
  final Color backgroundColor;
  final double checkboxSize;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.transparent,
    this.checkColor = Colors.white,
    this.backgroundColor = Colors.blue, // Default color
    this.checkboxSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: checkboxSize,
        height: checkboxSize,
        decoration: BoxDecoration(
          color:
              value ? backgroundColor : Colors.transparent, // Background color
          border: Border.all(
            color: value ? activeColor : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: checkboxSize - 8,
                color: checkColor,
              )
            : null,
      ),
    );
  }
}
