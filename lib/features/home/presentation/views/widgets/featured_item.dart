import 'package:flutter/material.dart';
import 'package:fruity/core/helper/functions.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/core/utils/app_styles/app_text_styles.dart';
import 'package:fruity/features/home/presentation/views/widgets/featured_button.dart';
import 'package:fruity/generated/l10n.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 335 / 158,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              // left: 0,
              // right: itemWidth * 0.3,
              child: Image.asset(
                AppImages.imagesHomeListviewItem,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: itemWidth * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(isArabic() ? 0 : 4),
                  bottomRight: Radius.circular(isArabic() ? 4 : 0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    isArabic()
                        ? AppImages.imagesDiscount
                        : AppImages.imagesDiscountLTR,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    right: isArabic() ? 16 : 0, left: isArabic() ? 0 : 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      S.of(context).homeFeaturedTitle,
                      style: AppTextStyles.cairoRegular13
                          .copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      S.of(context).homeFeauredSubtitle,
                      style: AppTextStyles.cairoBold19.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const FeaturedButton(),
                    const SizedBox(
                      height: 29,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
