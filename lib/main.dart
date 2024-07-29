import 'package:flutter/material.dart';
import 'package:fruity/core/helper/functions/on_generate_route.dart';
import 'package:fruity/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const Fruity());
}

class Fruity extends StatelessWidget {
  const Fruity({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
