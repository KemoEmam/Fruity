import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/helper/functions.dart';
import 'package:fruity/core/router/routes.dart';
import 'package:fruity/core/services/firebase_auth_service.dart';
import 'package:fruity/core/services/shared_prefs_service.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:go_router/go_router.dart';

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
          mainAxisAlignment:
              isArabic() ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppImages.imagesPlant,
            ),
          ],
        ),
        Center(
          child: SvgPicture.asset(
            AppImages.imagesLogo,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: SvgPicture.asset(
            AppImages.imagesBottomBubbles,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingSeen = PrefsService.getBool(kIsOnboardingSeen);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        if (isOnBoardingSeen) {
          // Check if user is signed in
          var isSignedIn = FirebaseAuthService().isLoggedIn();
          if (isSignedIn) {
            context.go(Routes.home);
          } else {
            context.go(Routes.signin);
          }
        } else {
          context.go(Routes.onboarding);
        }
      },
    );
  }
}
