import 'package:flutter/material.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/custom_text_button.dart';
import 'package:fruity/core/helper/functions/functions.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/generated/l10n.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: isArabic() ? kHorizontalPadding : 0,
          left: isArabic() ? 0 : kHorizontalPadding),
      child: Row(
        children: [
          Text(
            S.of(context).homeBestSellersTitle,
            style: AppTextStyles.cairoBold16,
          ),
          const Spacer(),
          CustomTextButton(
            text: S.of(context).homeBestSellersMore,
            textStyle: AppTextStyles.cairoRegular13.copyWith(
              color: const Color(0xff949D9E),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
