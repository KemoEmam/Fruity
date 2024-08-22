import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/core/helper/directional_widget.dart';
import 'package:fruity/generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.subtitle,
    required this.title,
    this.positioned,
  });

  final String backgroundImage, image;
  final String subtitle;
  final Widget title;
  final double? positioned;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                child: DirectionalWidget(
                  padding: const EdgeInsets.only(left: 14, top: 28),
                  child: Text(
                    S.of(context).onboardngSkip,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
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
                right: positioned,
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
