import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/directional_widget.dart';
import 'package:fruity/core/services/shared_prefs_service.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/features/auth/presentation/views/signin_view.dart';

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
                AppImages.imagesPlant,
              ),
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
    bool isOnBoardingSeen = SharedPrefsService.getBool(kIsOnboardingSeen);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        if (isOnBoardingSeen) {
          Navigator.of(context).pushReplacementNamed(SigninView.routeName);
        } else {
          Navigator.of(context).pushReplacementNamed(SigninView.routeName);
        }
      },
    );
  }
}
