import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruity/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          positioned: 18,
          backgroundImage: Assets.imagesOnBoarding1Background,
          image: Assets.imagesOnBoarding1Fruit,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).onboardng1Title1),
              Text(S.of(context).onboardng1Title2),
              Text(S.of(context).onboardng1Title3),
            ],
          ),
          subtitle: S.of(context).onboardng1Subtitle,
        ),
        PageViewItem(
          positioned: -3,
          backgroundImage: Assets.imagesOnBoarding2Background,
          image: Assets.imagesOnBoarding2Fruit,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).onboardng2Title,
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
          subtitle: S.of(context).onboardng2Subtitle,
        ),
      ],
    );
  }
}
