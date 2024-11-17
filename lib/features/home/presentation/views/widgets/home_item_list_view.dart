import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruity/core/utils/app_images.dart';

class HomeItemListView extends StatelessWidget {
  const HomeItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 158,
          child: Image.asset(AppImages.imagesHomeListviewTest1),
        ),
        SvgPicture.asset(AppImages.imagesHomeListviewDiscount),
        const Column(
          children: [Text('عروض العيد'), Text('خصم 25%'), Text('خصم 25%')],
        ),
      ],
    );
  }
}
