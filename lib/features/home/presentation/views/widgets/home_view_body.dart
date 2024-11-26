import 'package:flutter/material.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruity/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruity/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruity/features/home/presentation/views/widgets/featured_item_list_view.dart';
import 'package:fruity/features/home/presentation/views/widgets/home_search_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: kVerticalPadding,
              ),
              CustomHomeAppBar(),
              SizedBox(
                height: 12,
              ),
              HomeSearchField(),
              SizedBox(
                height: 12,
              ),
              FeaturedItemListView(),
              SizedBox(
                height: 8,
              ),
              BestSellingHeader(),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        BestSellingGridView(),
      ],
    );
  }
}
