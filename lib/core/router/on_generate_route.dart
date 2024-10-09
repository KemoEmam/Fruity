import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruity/features/auth/presentation/views/signin_view.dart';
import 'package:fruity/features/auth/presentation/views/signup_view.dart';
import 'package:fruity/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruity/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  hideSplashBorders(settings);
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}

void hideSplashBorders(RouteSettings settings) {
  if (settings.name == SplashView.routeName) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  } else {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }
}
