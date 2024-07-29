import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/core/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Assets.assetsImagesPlant,
            ),
          ],
        ),
        SvgPicture.asset(
          Assets.assetsImagesLogo,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SvgPicture.asset(
            Assets.assetsImagesBottomBubbles,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
