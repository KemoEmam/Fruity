import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/components/custom_search_field.dart';
import 'package:fruity/core/utils/app_images.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          shadows: const [
            BoxShadow(
              color: Color(0x0A000000),
              spreadRadius: 0,
              blurRadius: 9,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: CustomSearchField(
          replaceSuffixWithClearIcon: true,
          borderWidth: 0,
          borderColor: Colors.transparent,
          hintText: 'ابحث عن.......',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15, right: 8),
            child: SvgPicture.asset(AppImages.imagesSearchHome),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(11),
            child: SvgPicture.asset(AppImages.imagesMenuSearch),
          ),
        ),
      ),
    );
  }
}
