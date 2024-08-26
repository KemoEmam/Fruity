import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_images.dart';
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
          positioned: 18,
          backgroundImage: Assets.imagesOnBoarding1Background,
          image: Assets.imagesOnBoarding1Fruit,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).onboarding1Title1),
              Text(S.of(context).onboarding1Title2),
              Text(S.of(context).onboarding1Title3),
            ],
          ),
          subtitle: S.of(context).onboarding1Subtitle,
        ),
        PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          positioned: -4,
          backgroundImage: Assets.imagesOnBoarding2Background,
          image: Assets.imagesOnBoarding2Fruit,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).onboarding2Title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0C0D0D),
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
          subtitle: S.of(context).onboarding2Subtitle,
        ),
      ],
    );
  }
}
