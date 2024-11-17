import 'package:flutter/material.dart';
import 'package:fruity/features/home/presentation/views/widgets/home_item_list_view.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const HomeItemListView(),
    );
  }
}
