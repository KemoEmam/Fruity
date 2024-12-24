import 'package:flutter/material.dart';
import 'package:fruity/core/components/custom_app_bar.dart';
import 'package:fruity/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import 'package:fruity/generated/l10n.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'best selling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, S.of(context).homeBestSellersTitle),
      body: const BestSellingViewBody(),
    );
  }
}
