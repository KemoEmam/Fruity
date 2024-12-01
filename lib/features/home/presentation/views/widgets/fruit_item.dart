import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/core/utils/app_styles/app_colors.dart';

import '../../../../../core/utils/app_styles/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * .3,
                child:
                    //TODO: This be replaced with cached network image
                    Image.asset(
                  AppImages.imagesFruitMellon,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                title: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('فراولة', style: AppTextStyles.cairoSemiBold13),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '30جنية ',
                        style: AppTextStyles.cairoBold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: AppTextStyles.cairoBold13.copyWith(
                          color: AppColors.secondaryLightColor,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: AppTextStyles.cairoSemiBold13.copyWith(
                          color: AppColors.secondaryLightColor,
                        ),
                      ),
                      TextSpan(
                        text: 'الكيلو',
                        style: AppTextStyles.cairoSemiBold13.copyWith(
                          color: AppColors.secondaryLightColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ),
      ],
    );
  }
}
