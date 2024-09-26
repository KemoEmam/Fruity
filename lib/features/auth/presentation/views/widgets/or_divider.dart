import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFDDDFDF),
            thickness: 1,
          ),
        ),
        const SizedBox(width: 18),
        Text(S.of(context).loginOr, style: AppTextStyles.cairoSemiBold16),
        const SizedBox(width: 18),
        const Expanded(
          child: Divider(
            color: Color(0xFFDDDFDF),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
