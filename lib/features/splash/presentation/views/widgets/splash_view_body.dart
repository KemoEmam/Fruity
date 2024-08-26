import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/core/widgets/directional_widget.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/features/on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            DirectionalWidget(
              mirror: true,
              child: SvgPicture.asset(
                Assets.imagesPlant,
              ),
            ),
          ],
        ),
        Center(
          child: SvgPicture.asset(
            Assets.imagesLogo,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: SvgPicture.asset(
            Assets.imagesBottomBubbles,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      },
    );
  }
}
