import 'package:flutter/material.dart';
import 'package:fruity/core/layout/testos/cart.dart';
import 'package:fruity/core/layout/testos/products.dart';
import 'package:fruity/core/layout/testos/profile.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/features/home/presentation/views/home_view.dart';
import 'package:fruity/generated/l10n.dart';

class DestinationEntity {
  final String icon;
  final String activeIcon;
  final String label;
  final Widget screen;

  DestinationEntity({
    required this.screen,
    required this.activeIcon,
    required this.icon,
    required this.label,
  });
}

List<DestinationEntity> getDestinationEntity(BuildContext context) {
  return [
    DestinationEntity(
      icon: AppImages.imagesHomeIcon,
      activeIcon: AppImages.imagesHomeActive,
      label: S.of(context).navBarHome,
      screen: const HomeView(),
    ),
    DestinationEntity(
      icon: AppImages.imagesProductsIcon,
      activeIcon: AppImages.imagesProductsActive,
      label: S.of(context).navBarProducts,
      screen: const Products(),
    ),
    DestinationEntity(
      icon: AppImages.imagesShoppingCart,
      activeIcon: AppImages.imagesShoppingCartActive,
      label: S.of(context).navBarCart,
      screen: const Cart(),
    ),
    DestinationEntity(
      icon: AppImages.imagesProfile,
      activeIcon: AppImages.imagesProfileActive,
      label: S.of(context).navBarProfile,
      screen: const Profile(),
    ),
  ];
}
