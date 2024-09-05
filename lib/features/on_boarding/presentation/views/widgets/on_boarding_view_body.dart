import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';
import 'package:fruity/core/components/custom_button.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:fruity/generated/l10n.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController = PageController();
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            spacing: const EdgeInsets.only(left: 6, right: 6),
            size: const Size.square(10),
            activeSize: const Size(10, 10),
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 29),
        Visibility(
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          visible: currentPage == 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              text: S.current.onboardingButton,
              textStyle: AppTextStyles.cairoBold16,
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
