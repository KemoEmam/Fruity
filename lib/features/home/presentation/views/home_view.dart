import 'package:flutter/material.dart';
import 'package:fruity/core/components/custom_app_bar.dart';
import 'package:fruity/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "testoos"),
      body: const HomeViewBody(),
    );
  }
}
