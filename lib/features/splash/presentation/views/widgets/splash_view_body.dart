import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/directional_widget.dart';
import 'package:fruity/core/services/shared_prefs_service.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/features/auth/login_view.dart';
import 'package:fruity/features/on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation(context);
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

  void executeNavigation(BuildContext context) {
    bool isOnBoardingSeen = SharedPrefsService.getBool(kIsOnboardingSeen);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (isOnBoardingSeen) {
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            } else {
              Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
            }
          },
        );
      },
    );
  }
}
