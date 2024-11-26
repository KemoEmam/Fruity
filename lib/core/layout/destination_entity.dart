import 'package:flutter/material.dart';
import 'package:fruity/core/utils/app_images.dart';
import 'package:fruity/generated/l10n.dart';

class DestinationEntity {
  final String id; // Unique identifier
  final String icon;
  final String activeIcon;
  final String label;

  DestinationEntity({
    required this.id,
    required this.activeIcon,
    required this.icon,
    required this.label,
  });
}

List<DestinationEntity> getDestinationEntity(BuildContext context) {
  return [
    DestinationEntity(
      id: 'home', // Unique identifier
      icon: AppImages.imagesHomeIcon,
      activeIcon: AppImages.imagesHomeActive,
      label: S.of(context).navBarHome,
    ),
    DestinationEntity(
      id: 'products',
      icon: AppImages.imagesProductsIcon,
      activeIcon: AppImages.imagesProductsActive,
      label: S.of(context).navBarProducts,
    ),
    DestinationEntity(
      id: 'cart',
      icon: AppImages.imagesShoppingCart,
      activeIcon: AppImages.imagesShoppingCartActive,
      label: S.of(context).navBarCart,
    ),
    DestinationEntity(
      id: 'profile',
      icon: AppImages.imagesProfile,
      activeIcon: AppImages.imagesProfileActive,
      label: S.of(context).navBarProfile,
    ),
  ];
}
