import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/core/components/custom_text_button.dart';
import 'package:fruity/core/components/directional_widget.dart';
import 'package:fruity/generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.subtitle,
    required this.title,
    this.positionedRight,
    required this.isVisible,
  });

  final String backgroundImage, image;
  final String subtitle;
  final Widget title;
  final double? positionedRight;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Visibility(
                visible: isVisible,
                child: DirectionalWidget(
                  padding: const EdgeInsets.only(top: 22, left: 6),
                  child: CustomTextButton(
                    text: S.of(context).onboardingSkip,
                    onPressed: () {},
                  ),
                ),
              ),
              Positioned.fill(
                top: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: positionedRight,
                child: SvgPicture.asset(image),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AutoSizeText(
            textAlign: TextAlign.center,
            subtitle,
            minFontSize: 12,
          ),
        ),
      ],
    );
  }
}
