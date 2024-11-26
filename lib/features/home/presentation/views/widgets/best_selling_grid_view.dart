import 'package:flutter/material.dart';
import 'package:fruity/features/home/presentation/views/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 14,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return const FruitItem();
      },
    );
  }
}
