import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/core/components/custom_text_button.dart';
import 'package:fruity/core/components/directional_widget.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/auth/login_view.dart';
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
    required this.textStyle,
  });

  final String backgroundImage, image;
  final String subtitle;
  final Widget title;
  final double? positionedRight;
  final bool isVisible;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
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
              Visibility(
                visible: isVisible,
                child: DirectionalWidget(
                  padding: const EdgeInsets.only(top: 22, left: 6),
                  child: CustomTextButton(
                    text: S.of(context).onboardingSkip,
                    textStyle: AppTextStyles.cairoRegular13,
                    textColor: const Color(0xFF949D9E),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginView.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: AutoSizeText(
            textAlign: TextAlign.center,
            subtitle,
            style: textStyle,
            minFontSize: 12,
          ),
        ),
      ],
    );
  }
}
