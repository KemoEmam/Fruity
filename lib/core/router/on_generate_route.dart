import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruity/core/layout/navigation_bar_layout.dart';
import 'package:fruity/features/auth/presentation/views/password_view.dart';
import 'package:fruity/features/auth/presentation/views/signin_view.dart';
import 'package:fruity/features/auth/presentation/views/signup_view.dart';
import 'package:fruity/features/home/presentation/views/home_view.dart';
import 'package:fruity/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruity/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final bool hideNavBar = settings.arguments as bool? ?? false;

  Widget page;
  switch (settings.name) {
    case SplashView.routeName:
      page = const SplashView();
      break;
    case OnBoardingView.routeName:
      page = const OnBoardingView();
      break;
    case SigninView.routeName:
      page = const SigninView();
      break;
    case PasswordView.routeName:
      page = const PasswordView();
      break;
    case SignupView.routeName:
      page = const SignupView();
      break;
    case HomeView.routeName:
      page = const NavigationBarLayout();
      break;
    default:
      page = const Scaffold(body: Center(child: Text("Unknown Route")));
  }

  // Wrap page if nav bar needs to be hidden
  if (hideNavBar) {
    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  } else {
    return MaterialPageRoute(
      builder: (_) => NavigationBarLayout(child: page),
      settings: settings,
    );
  }
}

void hideSplashBorders(RouteSettings settings) {
  if (settings.name == SplashView.routeName) {
    // CustomButtonP
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
