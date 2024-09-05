import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruity/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          positionedRight: 18,
          backgroundImage: Assets.imagesOnBoarding1Background,
          image: Assets.imagesOnBoarding1Fruit,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).onboarding1Title1,
                style: AppTextStyles.cairoBold23.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                S.of(context).onboarding1Title2,
                style: AppTextStyles.cairoBold23
                    .copyWith(color: AppColors.secondaryColor),
              ),
              Text(
                S.of(context).onboarding1Title3,
                style: AppTextStyles.cairoBold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subtitle: S.of(context).onboarding1Subtitle,
          textStyle: AppTextStyles.cairoSemiBold13.copyWith(
            color: const Color(0xFF4E5556),
          ),
        ),
        PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          positionedRight: -4,
          backgroundImage: Assets.imagesOnBoarding2Background,
          image: Assets.imagesOnBoarding2Fruit,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                S.of(context).onboarding2Title,
                style: AppTextStyles.cairoBold23.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
            ],
          ),
          subtitle: S.of(context).onboarding2Subtitle,
          textStyle: AppTextStyles.cairoSemiBold13.copyWith(
            color: const Color(0xFF4E5556),
          ),
        ),
      ],
    );
  }
}
