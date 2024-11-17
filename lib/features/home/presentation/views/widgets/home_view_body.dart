import 'package:flutter/material.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruity/features/home/presentation/views/widgets/home_list_view.dart';
import 'package:fruity/features/home/presentation/views/widgets/home_search_bar.dart';

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
              SizedBox(
                height: 200,
                child: HomeListView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
